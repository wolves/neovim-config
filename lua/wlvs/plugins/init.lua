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
  -- TODO: this plugin will be redundant once https://github.com/neovim/neovim/pull/15436 is merged
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
  -- Keys
  ------------------------------------------------------------------------------//
  use {
    'folke/which-key.nvim',
    config = function()
      require('wlvs.plugins.whichkey')
    end,
  }

  ------------------------------------------------------------------------------//
  -- Telescope
  ------------------------------------------------------------------------------//
  use {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    keys = { '<c-p>' },
    module_pattern = 'telescope.*',
    config = conf 'telescope',
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
        after = "telescope.nvim",
        config = function()
          require("telescope").load_extension "fzf"
        end,
      }
    },
  }

  ------------------------------------------------------------------------------//
  -- Treesitter
  ------------------------------------------------------------------------------//

  ------------------------------------------------------------------------------//
  -- User Interface
  ------------------------------------------------------------------------------//

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- Colors
  use {
    'rebelot/kanagawa.nvim',
    config = conf 'colorscheme'
  }

  end,
  ------------------------------------------------------------------------------//
  -- Packer Config
  ------------------------------------------------------------------------------//
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
