local utils = require 'wlvs.utils.plugins'

local conf = utils.conf
local packer_notify = utils.packer_notify

local fn = vim.fn
local fmt = string.format

local PACKER_COMPILED_PATH = fn.stdpath 'cache' .. '/packer/packer_compiled.lua'

------------------------------------------------------------------------------//
-- Bootstrap Packer
------------------------------------------------------------------------------//
utils.bootstrap_packer()

wlvs.safe_require 'impatient'

require('packer').startup {
  function(use, use_rocks)

    use { 'wbthomason/packer.nvim', opt = true }

    ------------------------------------------------------------------------------//
    -- Core
    ------------------------------------------------------------------------------//
    use { 'nvim-lua/plenary.nvim' }
    use { "nvim-lua/popup.nvim" }

    ------------------------------------------------------------------------------//
    -- Keys
    ------------------------------------------------------------------------------//

    use { 'folke/which-key.nvim', config = conf 'whichkey' }

    ------------------------------------------------------------------------------//
    -- Telescope
    ------------------------------------------------------------------------------//
    --
    use {
      'ahmedkhalf/project.nvim',
      config = function()
        require('project_nvim').setup()
      end,
    }

    use {
      'nvim-telescope/telescope.nvim',
      cmd = 'Telescope',
      keys = { '<c-p>', '<leader>ff', '<leader>fo', '<leader>fs' },
      module_pattern = 'telescope.*',
      config = conf 'telescope',
      requires = {
      {
          "nvim-telescope/telescope-fzf-native.nvim",
          run = "make",
          after = "telescope.nvim",
          config = function()
            require("telescope").load_extension "fzf"
          end,
        },
      {
          'nvim-telescope/telescope-frecency.nvim',
          after = 'telescope.nvim',
          requires = 'tami5/sqlite.lua',
        },
      },
    }

    ------------------------------------------------------------------------------//
    -- Treesitter
    ------------------------------------------------------------------------------//

    -- TODO: if a plugin which is specified as after for other plugins is converted to opt=true
    -- trying to move that plugin to the opt directory fails
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      event = 'BufReadPre',
      config = conf 'treesitter',
      local_path = 'contributing',
      wants = { 'null-ls.nvim' },
      requires = {
      { 'p00f/nvim-ts-rainbow', after = 'nvim-treesitter' },
      { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' },
      {
          'nvim-treesitter/playground',
          keys = '<leader>E',
          cmd = { 'TSPlaygroundToggle', 'TSHighlightCapturesUnderCursor' },
          setup = function()
            require('which-key').register { ['<leader>E'] = 'treesitter: highlight cursor group' }
          end,
          config = function()
            wlvs.nnoremap('<leader>E', '<Cmd>TSHighlightCapturesUnderCursor<CR>')
          end,
        },
      },
    }

    use {
      'abecodes/tabout.nvim',
      wants = { 'nvim-treesitter' },
      after = { 'nvim-cmp' },
      config = function()
        require('tabout').setup {
          completion = false,
          ignore_beginning = false,
        }
      end,
    }
    ----------------------------------------------------------------------------//
    -- GIT
    -----------------------------------------------------------------------------//
    use { "lewis6991/gitsigns.nvim", config = conf 'gitsigns' }
    use {
      "TimUntersberger/neogit",
      cmd = "Neogit",
      requires = "plenary.nvim",
      setup = conf('neogit').setup,
      config = conf('neogit').config,
    }
    ----------------------------------------------------------------------------//
    -- LSP,Completion & Debugger {{{1
    -----------------------------------------------------------------------------//
    use { 'neovim/nvim-lspconfig', config = conf 'lspconfig' }
    use {
      'williamboman/nvim-lsp-installer',
      requires = 'nvim-lspconfig',
      config = function()
        local lsp_installer_servers = require 'nvim-lsp-installer.servers'
        for name, _ in pairs(wlvs.lsp.servers) do
          ---@type boolean, table|string
          local ok, server = lsp_installer_servers.get_server(name)
          if ok then
            if not server:is_installed() then
              server:install()
            end
          end
        end
      end,
    }

    use 'b0o/schemastore.nvim'

    use {
      'jose-elias-alvarez/null-ls.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      -- trigger loading after lspconfig has started the other servers
      -- since there is otherwise a race condition and null-ls' setup would
      -- have to be moved into lspconfig.lua otherwise
      config = function()
        local null_ls = require 'null-ls'
        -- NOTE: this plugin will break if it's dependencies are not installed
        null_ls.setup {
          debounce = 150,
          on_attach = wlvs.lsp.on_attach,
          sources = {
            null_ls.builtins.code_actions.gitsigns,
            null_ls.builtins.formatting.stylua.with {
              condition = function(_utils)
                return wlvs.executable 'stylua' and _utils.root_has_file 'stylua.toml'
              end,
            },
            null_ls.builtins.formatting.prettier.with {
              filetypes = { 'html', 'json', 'yaml', 'graphql', 'markdown' },
              condition = function()
                return wlvs.executable 'prettier'
              end,
            },
          },
        }
      end,
    }

    use {
      'ray-x/lsp_signature.nvim',
      config = function()
        require('lsp_signature').setup {
          bind = true,
          fix_pos = false,
          auto_close_after = 15, -- close after 15 seconds
          hint_enable = false,
          handler_opts = { border = 'rounded' },
        }
      end,
    }

    use {
      'hrsh7th/nvim-cmp',
      module = 'cmp',
      event = 'InsertEnter',
      requires = {
      { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-lspconfig' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
        -- { 'hrsh7th/cmp-nvim-lsp-document-symbol', after = 'nvim-cmp' },
        -- { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
        -- { 'f3fora/cmp-spell', after = 'nvim-cmp' },
        -- { 'petertriho/cmp-git', after = 'nvim-cmp' },
        -- { 'tzachar/cmp-tabnine', run = './install.sh', after = 'nvim-cmp' },
      },
      config = conf 'cmp',
    }

    use {
      'AckslD/nvim-neoclip.lua',
      config = function()
        require('neoclip').setup {
          enable_persistent_history = true,
          keys = {
            telescope = {
              i = { select = '<c-p>', paste = '<CR>', paste_behind = '<c-k>' },
              n = { select = 'p', paste = '<CR>', paste_behind = 'P' },
            },
          },
        }
        local function clip()
          require('telescope').extensions.neoclip.default(
            require('telescope.themes').get_dropdown()
          )
        end

        require('which-key').register {
          ['<localleader>p'] = { clip, 'neoclip: open yank history' },
        }
      end,
    }

    use {
      'L3MON4D3/LuaSnip',
      event = 'InsertEnter',
      module = 'luasnip',
      requires = 'rafamadriz/friendly-snippets',
      config = conf 'luasnip',
    }

    ------------------------------------------------------------------------------//
    -- Editor
    ------------------------------------------------------------------------------//

    use { "max397574/better-escape.nvim", config = conf 'better-escape' }
    use { "akinsho/toggleterm.nvim", config = conf 'toggleterm' }

    ------------------------------------------------------------------------------//
    -- User Interface
    ------------------------------------------------------------------------------//

    -- Icons
    use 'kyazdani42/nvim-web-devicons'

    use {
      "akinsho/bufferline.nvim",
      config = conf 'bufferline',
      requires = 'nvim-web-devicons',
    }

    use { 'moll/vim-bbye' }

    -- Colors
    use {
      'rebelot/kanagawa.nvim',
      config = conf 'colorscheme'
    }
    use { 'folke/tokyonight.nvim' }

    ------------------------------------------------------------------------------//
    -- Text Editing
    ------------------------------------------------------------------------------//

    use {
      'AndrewRadev/splitjoin.vim',
      config = function()
        require('which-key').register { gS = 'splitjoin: split', gJ = 'splitjoin: join' }
      end,
    }

    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end,
    }

    ------------------------------------------------------------------------------//
    -- Profiling & Startup
    ------------------------------------------------------------------------------//
    use {
      'nathom/filetype.nvim',
      config = function()
        require('filetype').setup {
          overrides = {
            literal = {
              ['kitty.conf'] = 'kitty',
              ['.gitignore'] = 'conf',
              ['.env'] = 'sh',
            },
          },
        }
      end,
    }

    use 'lewis6991/impatient.nvim'
    use {
      'dstein64/vim-startuptime',
      cmd = 'StartupTime',
      config = function()
        vim.g.startuptime_tries = 15
        vim.g.startuptime_exe_args = { '+let g:auto_session_enabled = 0' }
      end,
    }


    ------------------------------------------------------------------------------//
    -- Languages
    ------------------------------------------------------------------------------//
    use {
      'ray-x/go.nvim',
      ft = 'go',
      config = function()
        require('go').setup()
      end,
    }

    use 'plasticboy/vim-markdown'
    ------------------------------------------------------------------------------//
    -- Packer Config
    ------------------------------------------------------------------------------//
  end,
  log = { level = 'info' },
  config = {
    compile_path = PACKER_COMPILED_PATH,
    display = {
      prompt_border = 'rounded',
      open_cmd = 'silent topleft 65vnew',
    },
    profile = {
      enable = true,
      threshold = 1,
    },
  },
}

------------------------------------------------------------------------------//
-- Packer Commands
------------------------------------------------------------------------------//
wlvs.command {
  'PackerCompiledEdit',
  function()
    vim.cmd(fmt('edit %s', PACKER_COMPILED_PATH))
  end,
}

wlvs.command {
  'PackerCompiledDelete',
  function()
    vim.fn.delete(PACKER_COMPILED_PATH)
    packer_notify(fmt('Deleted %s', PACKER_COMPILED_PATH))
  end,
}

if not vim.g.packer_compiled_loaded and vim.loop.fs_stat(PACKER_COMPILED_PATH) then
  wlvs.source(PACKER_COMPILED_PATH)
  vim.g.packer_compiled_loaded = true
end

wlvs.augroup('PackerSetupInit', {
{
    events = { 'BufWritePost' },
    targets = { '*/wlvs/plugins/*.lua' },
    command = function()
      wlvs.invalidate('wlvs.plugins', true)
      require('packer').compile()
    end,
  },
})
wlvs.nnoremap('<leader>ps', [[<Cmd>PackerSync<CR>]])
wlvs.nnoremap('<leader>pc', [[<Cmd>PackerClean<CR>]])

-- vim:foldmethod=marker