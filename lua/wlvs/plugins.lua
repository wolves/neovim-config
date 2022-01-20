local fn = vim.fn

-- fn.setenv("MACOSX_DEPLOYMENT_TARGET", "10.15")
-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  use("wbthomason/packer.nvim") -- Have packer manage itself
  use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
  use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

  use("lewis6991/impatient.nvim")

  -- Startup
  use({ "dstein64/vim-startuptime", cmd = "StartupTime", config = [[vim.g.startuptime_tries = 10]] })

  --
  use("nathom/filetype.nvim")
  use({
    "max397574/better-escape.nvim",
    config = function()
      require("wlvs.better-escape")
    end,
  })
  use("numToStr/Comment.nvim") -- Easily comment stuff
  use("kyazdani42/nvim-web-devicons")
  use("kyazdani42/nvim-tree.lua") -- Better explorer

  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v1.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("wlvs/neo-tree")
    end,
  })
  use("akinsho/bufferline.nvim")
  use("moll/vim-bbye")
  use("nvim-lualine/lualine.nvim")
  use("akinsho/toggleterm.nvim")
  use({
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = function()
      require("wlvs.indentline")
    end,
  })
  use({
    "antoinemadec/FixCursorHold.nvim",
    run = function()
      vim.g.curshold_updatime = 1000
    end,
  }) -- This is needed to fix lsp doc highlight
  use("folke/todo-comments.nvim")

  use({
    "folke/which-key.nvim",
  })

  use("ThePrimeagen/harpoon")
  use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
  use("blackCauldron7/surround.nvim")
  use("karb94/neoscroll.nvim")
  use("rcarriga/nvim-notify")

  -- Colors
  use("folke/tokyonight.nvim")
  use("rebelot/kanagawa.nvim")
  use({
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
      require("wlvs.colorizer")
    end,
  })

  -- Completion
  use({
    "hrsh7th/nvim-cmp",
    wants = { "LuaSnip" },
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      -- "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      {
        "L3MON4D3/LuaSnip",
        wants = "friendly-snippets",
      },
      "rafamadriz/friendly-snippets",
    },
  })

  -- Language Specific
  use({
    "ray-x/go.nvim",
    commit = "22fe0379de1aed3ffa160ce3dfb62bc07e369ef7",
  })

  -- LSP
  use({
    "neovim/nvim-lspconfig",
    wants = {
      "cmp-nvim-lsp",
    },
    config = function()
      require("wlvs.lsp")
    end,
    requires = {
      "jose-elias-alvarez/nvim-lsp-ts-utils",
      "jose-elias-alvarez/null-ls.nvim",
      "folke/lua-dev.nvim",
      "williamboman/nvim-lsp-installer",
    },
  }) -- enable LSP
  use({
    "williamboman/nvim-lsp-installer",
    requires = "nvim-lspconfig",
    config = function()
      local servers = require("wlvs.lsp").servers()
      require("wlvs.lsp.install").setup(servers)
    end,
  }) -- simple to use language server installer
  use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
  use("jose-elias-alvarez/nvim-lsp-ts-utils")
  use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
  --use("simrat39/symbols-outline.nvim")
  use({ "folke/trouble.nvim", cmd = "TroubleToggle" })
  use("RRethy/vim-illuminate")

  -- use({
  --   "ray-x/lsp_signature.nvim",
  --   config = function()
  --     require("wlvs.lsp.lsp-signature")
  --   end,
  -- })

  -- Telescope
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
    },
  })

  use({
    "nvim-telescope/telescope-packer.nvim",
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension("packer")
    end,
  })
  use({
    "ahmedkhalf/project.nvim",
    after = "telescope.nvim",
    config = function()
      require("wlvs.projects")
      require("telescope").load_extension("projects")
    end,
  })
  use({
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  })
  use({
    "nvim-telescope/telescope-frecency.nvim",
    ensure_dependencies = true,
    after = "telescope.nvim",
    requires = "tami5/sqlite.lua",
    config = function()
      require("telescope").load_extension("frecency")
    end,
  })

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  -- use("nvim-treesitter/nvim-treesitter-textobjects")
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use({
    "ChristianChiarulli/nvim-ts-rainbow",
    requires = "nvim-treesitter/nvim-treesitter",
  })
  use({ "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" })
  use("windwp/nvim-ts-autotag")
  use({
    "andymass/vim-matchup",
    requires = "nvim-treesitter/nvim-treesitter",
  })
  --use("romgrk/nvim-treesitter-context")

  -- Git
  use("lewis6991/gitsigns.nvim")
  use({ "TimUntersberger/neogit", cmd = "Neogit" })
  use("f-person/git-blame.nvim")

  -- Testing
  use({
    "rcarriga/vim-ultest",
    wants = "vim-test",
    requires = { "vim-test/vim-test" },
    run = ":UpdateRemotePlugins",
  })

  -- DAP - Debugging
  -- TODO: Install and get integrated with delve for Go
  -- use "mfussenegger/nvim-dap"
  -- use "theHamsta/nvim-dap-virtual-text"
  -- use "rcarriga/nvim-dap-ui"
  -- use "Pocco81/DAPInstall.nvim"

  -- Vim
  use("AndrewRadev/splitjoin.vim")

  -- Writing
  use({
    "folke/zen-mode.nvim",
    ft = "markdown",
    ensure_dependencies = true,
    requires = {
      "preservim/vim-pencil",
    },
    config = function()
      require("wlvs.zen-mode")
    end,
  })

  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
    cmd = { "MarkdownPreview" },
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
