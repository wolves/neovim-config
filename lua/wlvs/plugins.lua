require('packer_compiled')

local spec = function(use)

  use {
    "wbthomason/packer.nvim",
    opt = true
  }

  -- DEPS
  use { "tami5/sql.nvim" }
  use { "nvim-lua/popup.nvim" }
  use { "nvim-lua/plenary.nvim" }

  -- UX

  -- Smooth Scrolling
  use { "karb94/neoscroll.nvim",
    config = function()
      require("wlvs.scroll")
    end,
  }
  use {"ThePrimeagen/harpoon"}

  -- UI
  use {
    "folke/lsp-trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end,
  }
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = "BufReadPost",
    config = function()
      require('wlvs.todos').config()
    end
  }


  -- TELESCOPE
  use {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("wlvs.telescope.setup").setup()
    end,
    requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
  }

  use({
    'mrjones2014/dash.nvim',
    run = 'make install',
  })


  use {
    "nvim-telescope/telescope-frecency.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension "frecency"
    end,
  }
  use {
    "nvim-telescope/telescope-symbols.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
  }

  -- use {
  --   "nvim-telescope/telescope-fzy-native.nvim",
  --   requires = { "nvim-telescope/telescope.nvim" },
  -- }

  -- use {
  --   "nvim-telescope/telescope-fzf-writer.nvim",
  --   requires = { "nvim-telescope/telescope.nvim" },
  -- }

  use {
    "nvim-telescope/telescope-project.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
    config = function()
      require('telescope').load_extension "project"
    end,
  }
  use {
    "nvim-telescope/telescope-packer.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
  }

  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
    requires = { "nvim-telescope/telescope.nvim" },
  }
  use {
    "nvim-telescope/telescope-file-browser.nvim",
    after = "telescope.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
    config = function()
      require('telescope').load_extension "file_browser"
    end,
  }

  -- PR Filter is:open is:pr review-requested:wolves archived:false
  -- use { "nvim-telescope/telescope-github.nvim"}

  -- use { "nvim-telescope/telescope-hop.nvim" }
  -- use { "nvim-telescope/telescope-cheat.nvim" }
  -- use { "telescope-hacks.nvim" }


  -- COMPLETION
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-vsnip"
  -- use "tamago324/cmp-zsh"
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      'onsails/lspkind-nvim'
      -- use { 'windwp/nvim-autopairs' }
    },
    config = function()
      require("wlvs.nvim-cmp").setup()
    end,
  }

  -- SNIPPETS
  use { "hrsh7th/vim-vsnip" }

  -- TREESITTER
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('wlvs.treesitter').setup()
    end,
  }
  use {
    "nvim-treesitter/playground",
    requires = "nvim-treesitter",
  }
  use {
    "nvim-treesitter/completion-treesitter",
    requires = "nvim-treesitter",
  }
  use {
    "nvim-treesitter/nvim-treesitter-refactor",
    requires = "nvim-treesitter",
  }
  use {
    "nvim-treesitter/nvim-treesitter-textobjects",
    requires = "nvim-treesitter",
  }

  -- LSP
  use { 'neovim/nvim-lspconfig' }
  use { 'nvim-lua/lsp-status.nvim' }
  use { 'nvim-lua/lsp_extensions.nvim' }
  use {
    'onsails/lspkind-nvim',
    config = function()
      require("lspkind").init()
    end,
  }
  -- use { 'ray-x/lsp_signature.nvim' }


  use {
    "antoinemadec/FixCursorHold.nvim",
    run = function()
      vim.g.curshold_updatime = 1000
    end,
  }

  --
  -- COLORSCHEME:

  use({
    "folke/tokyonight.nvim",
    -- event = "VimEnter",
    config = function()
      require("wlvs.theme")
    end,
  })

  -- VIM EDITOR:
  use 'lewis6991/impatient.nvim'
  -- Better profiling output for startup.
  use {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  }
  -- use { "kyazdani42/nvim-tree.lua" }

  -- Writing/Markdown Plugins
  use({
    "plasticboy/vim-markdown",
    opt = true,
    requires = "godlygeek/tabular",
    ft = "markdown",
  })
  use({
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
    setup = function()
      vim.g.mkdp_refresh_slow = 1
    end,
    ft = "markdown",
    cmd = { "MarkdownPreview" },
  })

  use {"ellisonleao/glow.nvim", cmd = "Glow"}

  -- Re-enable twilight after it stops crashing from markdown parser error
  use {
    "folke/zen-mode.nvim",
    -- cmd = "ZenMode",
    -- opt = true,
    wants = {
      -- "twilight.nvim",
      "vim-pencil",
    },
    requires = {
      -- "folke/twilight.nvim",
      "preservim/vim-pencil",
    },
    config = function()
      require("wlvs.zen").config()
    end
  }

  -- Tabs
  use({
    "akinsho/nvim-bufferline.lua",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("wlvs.bufferline")
    end,
  })

  -- Terminal
  use({
    "akinsho/nvim-toggleterm.lua",
    config = function()
      require("wlvs.terminal")
    end,
  })


  -- Statusline
  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require("wlvs.lualine")
    end,
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  use({
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
      require("wlvs.colorizer")
    end,
  })


  use({
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function()
      require("wlvs.keys")
    end,
  })

  use({ "mbbill/undotree", cmd = "UndotreeToggle" })


  --
  -- WIP: LANGUAGE:
  --

  -- TESTING

  -- use {
  --   "rcarriga/vim-ultest",
  --   requires = {"vim-test/vim-test"},
  --   run = ":UpdateRemotePlugins",
  --   config = function()
  --     -- vim.cmd([[
  --     --   augroup GoTestRunner
  --     --   au!
  --     --   au BufWritePost *_test.go 2TermExec cmd='go_test -v -cover -race' direction='vertical' size=90
  --     --   augroup END
  --     -- ]])
  --     vim.cmd([[
  --       augroup GoUltestRunner
  --       au!
  --       let test#go#gotest#options = '-v -cover -race'
  --       au BufWritePost *_test.go UltestNearest
  --       augroup END
  --     ]])
  --   end
  -- }
  -- au BufWrite *_test.go :echom "Running Go Tests"
  -- vim.cmd([[
  --   augroup GoUltestRunner
  --   au!
  --   let test#go#gotest#options = '-cover -race'
  --   au BufWritePost *_test.go UltestNearest
  --   augroup END
  -- ]])

  -- GO
  -- Testing out some options here. Need to determine the features I want...
  -- use({ "darrikonn/vim-gofmt" })
  use {
    "ray-x/go.nvim",
    tag = 'v0.1.0',
    requires = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'neovim/nvim-lspconfig',
    },
    config = function()
      require('wlvs.go-nvim').setup()
    end,
  }

  --
  -- Typescript

  if false then
    use "jelera/vim-javascript-syntax"
    use "othree/javascript-libraries-syntax.vim"
    use "leafgarland/typescript-vim"
    use "peitalin/vim-jsx-typescript"

    use { "vim-scripts/JavaScript-Indent", ft = "javascript" }
    use { "pangloss/vim-javascript", ft = { "javascript", "html" } }
  end

  -- use { "elzr/vimjson", ft = "json" }


  use({
    "prettier/vim-prettier",
    ft = { "html", "javascript", "typescript" },
    run = "yarn install"
  })


  -- TODO --
  -- use "rofl.nvim"
  -- use "hrsh7th/vim-vsnip-integ"
  -- use "norcalli/snippets.nvim"

  -- Cool tags based viewer
  --   :Vista  <-- Opens up a really cool sidebar with info about file.
  -- use { "liuchengxu/vista.vim", cmd = "Vista" }

  -- Find and replace
  -- use "windwp/nvim-spectre"
  --
  --
  --
  -- TODO: DEBUGGING

  -- Debug adapter protocol

  -- use 'puremourning/vimspector'
  -- use "mfussenegger/nvim-dap"
  -- use "rcarriga/nvim-dap-ui"
  -- use "theHamsta/nvim-dap-virtual-text"
  -- use "mfussenegger/nvim-dap-python"
  -- use "nvim-telescope/telescope-dap.nvim"

  -- Pocco81/DAPInstall.nvim


  --
  --
  -- TEXT MANIUPLATION
  use {
    'b3nj5m1n/kommentary',
    event = { 'BufRead', 'BufNewFile' },
    config = function()
      require('wlvs.kommentary').config()
    end,
  }
  -- use "tpope/vim-commentary" -- Easily comment out lines or objects
  -- use "tpope/vim-repeat" -- Repeat actions better
  -- use "tpope/vim-abolish" -- Cool things with words!
  -- use "tpope/vim-characterize"
  -- use { "tpope/vim-dispatch", cmd = { "Dispatch", "Make" } }
  --
  use { "AndrewRadev/splitjoin.vim" }

  -- TODO: Check out macvhakann/vim-sandwich - Quote: "TJ Devries"
  use "tpope/vim-surround" -- Surround text objects easily
--------------------------------------------------------------------------------
  --
  --
  -- WIP: GIT
  use({
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("wlvs.gitsigns")
    end,
  })
  use {
    "ruifm/gitlinker.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("gitlinker").setup()
    end,
  }
  -- Github integration
  use {
    "pwntester/octo.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("octo").setup {}
    end
  }
  use({
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    config = function()
      require("wlvs.diffview")
    end,
  })
  use({
    "TimUntersberger/neogit",
    requires = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    cmd = "Neogit",
    config = function()
      require("wlvs.neogit")
    end,
  })

  -- Git worktree utility
  -- use {
  -- "ThePrimeagen/git-worktree.nvim",
  -- config = function()
  -- require("git-worktree").setup {}
  -- end,
  -- disable = true,
  -- }



  -- Sweet message committer
  -- use "rhysd/committia.vim"


  -- Floating windows are awesome :)
  -- use {
  -- "rhysd/git-messenger.vim",
  -- keys = "<Plug>(git-messenger)",
  -- }

  --
  --

  -- use({
  --   "nvim-neorg/neorg",
  --   config = function()
  --     require("wlvs.neorg")
  --   end,
  --   requires = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-neorg/neorg-telescope"
  --   }
  -- })

  --
  -- TODO: Check These Out Later


  -- if false and vim.fn.executable "neuron" == 1 then
  -- use {
  -- "oberblastmeister/neuron.nvim",
  -- branch = "unstable",
  -- config = function()
  -- -- these are all the default values
  -- require("neuron").setup {
  -- virtual_titles = true,
  -- mappings = true,
  -- run = nil,
  -- neuron_dir = "~/neuron",
  -- leader = "gz",
  -- }
  -- end,
  -- }
  -- end

end

local config = {
  compile_path = vim.fn.stdpath('config')..'/lua/packer_compiled.lua',
  display = {
    -- Move to lua dir so impatient.nvim can cache it
    open_fn = function()
      return require("packer.util").float({ border = "single" })
      --   local bufnr, winnr = require("window").floating_window { border = true, width_per = 0.8, height_per = 0.8 }
      --   vim.api.nvim_set_current_win(winnr)
      --   return bufnr, winnr
    end,
    -- profile = {
    --   enable = true,
    --   threshold = 1,
    -- },
  },
}

-- Bootstrap Packer
local install_path = string.format("%s/site/pack/packer/opt/packer.nvim", vim.fn.stdpath "data")
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.notify "Downloading packer.nvim..."
  vim.notify(vim.fn.system { "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
  vim.cmd "packadd! packer.nvim"
  require("packer").startup { spec, config = config }
  require("packer").sync()
else
  vim.cmd "packadd! packer.nvim"
  require("packer").startup { spec, config = config }
end
