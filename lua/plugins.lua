local packer = require('util.packer')

local config = {
  profile = {
    enable = true,
    threshold = 0,
  },
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "single" })
    end,
  },
}

local function plugins(use)
  use({ "wbthomason/packer.nvim", opt = true })

--   use({
--     "hrsh7th/nvim-cmp",
--     event = "InsertEnter",
--     opt = true,
--     config = function()
--       require("config.cmp")
--     end,
--     wants = {},
--     requires = {},
--   })
  

  use({
    "hrsh7th/nvim-cmp",
    config = function()
      require("config.cmp")
    end
  })
  use({"hrsh7th/cmp-buffer"})
  use({"hrsh7th/cmp-path"})
  use({"hrsh7th/cmp-nvim-lsp"})

  -- LSP
  use({
    "neovim/nvim-lspconfig",
    opt = true,
    event = "BufReadPre",
    -- wants = { "workspace.nvim", "nvim-lsp-ts-utils", "null-ls.nvim", "lua-dev.nvim" },
    config = function()
      require("config.lsp")
    end,
    requires = {
      -- "jose-elias-alvarez/nvim-lsp-ts-utils",
      -- "jose-elias-alvarez/null-ls.nvim",
      -- "folke/lua-dev.nvim",
    },
  })

  use({
    "b3nj5m1n/kommentary",
    opt = true,
    wants = "nvim-ts-context-commentstring",
    keys = { "gc", "gcc" },
    config = function()
      require("config.comments")
    end,
    requires = "JoosepAlviste/nvim-ts-context-commentstring",
  })

  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    opt = true,
    event = "BufRead",
    requires = {
      {
        "nvim-treesitter/playground",
        cmd = "TSHighlightCapturesUnderCursor"
      },
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = [[require('config.treesitter')]],
  })

  -- Theme: color schemes
  -- use("tjdevries/colorbuddy.vim")
  use({
    -- "shaunsingh/nord.nvim",
    -- "shaunsingh/moonlight.nvim",
    -- { "olimorris/onedark.nvim", requires = "rktjmp/lush.nvim" },
    -- "joshdick/onedark.vim",
    -- "wadackel/vim-dogrun",
    -- { "npxbr/gruvbox.nvim", requires = "rktjmp/lush.nvim" },
    -- "bluz71/vim-nightfly-guicolors",
    -- { "marko-cerovac/material.nvim" },
    -- "sainnhe/edge",
    -- { "embark-theme/vim", as = "embark" },
    -- "norcalli/nvim-base16.lua",
    -- "RRethy/nvim-base16",
    -- "novakne/kosmikoa.nvim",
    -- "glepnir/zephyr-nvim",
    -- "ghifarit53/tokyonight-vim"
    -- "sainnhe/sonokai",
    -- "morhetz/gruvbox",
    -- "arcticicestudio/nord-vim",
    -- "drewtempelmeyer/palenight.vim",
    -- "Th3Whit3Wolf/onebuddy",
    -- "christianchiarulli/nvcode-color-schemes.vim",
    -- "Th3Whit3Wolf/one-nvim"

    "folke/tokyonight.nvim",
    -- event = "VimEnter",
    config = function()
      require("config.theme")
    end,
  })

  -- Theme: icons
  use({
    "kyazdani42/nvim-web-devicons",
    module = "nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({ default = true })
    end,
  })

  use({ "nvim-lua/plenary.nvim", module = "plenary" })
  use({ "nvim-lua/popup.nvim", module = "popup" })


  use({
    "nvim-telescope/telescope.nvim",
    opt = true,
    config = function()
      require("config.telescope")
    end,
    cmd = { "Telescope" },
    module = "telescope",
    keys = {
      "<C-p>",
      "<Leader>p",
      --"<Leader>pp",
      "<Leader>ps",
      "<Leader>pf",
      "<Leader>pb",
      "<Leader>pw",
      "<Leader>vn",
      "<Leader>vh",
      "<Leader>gb",
    },
    wants = {
      "plenary.nvim",
      "popup.nvim",
      "telescope-z.nvim",
      "telescope-fzy-native.nvim",
      "telescope-project.nvim",
      "trouble.nvim",
      "telescope-symbols.nvim",
    },
    requires = {
      "nvim-telescope/telescope-z.nvim",
      "nvim-telescope/telescope-project.nvim",
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-symbols.nvim",
      "nvim-telescope/telescope-fzy-native.nvim",
    },
  })

  -- Tabs
  use({
    "akinsho/nvim-bufferline.lua",
    event = "BufReadPre",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("config.bufferline")
    end,
  })

  -- Terminal
  use({
    "akinsho/nvim-toggleterm.lua",
    keys = "<C-t>",
    config = function()
      require("config.terminal")
    end,
  })

  -- Smooth Scrolling
  use({
    "karb94/neoscroll.nvim",
    keys = { "<C-u>", "<C-d>", "gg", "G" },
    config = function()
      require("config.scroll")
    end,
  })

  -- Git Gutter
  use({
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    wants = "plenary.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("config.gitsigns")
    end,
  })

  use({
    "TimUntersberger/neogit",
    cmd = "Neogit",
    config = function()
      require("config.neogit")
    end,
  })


  -- Statusline
  use({
    "hoob3rt/lualine.nvim",
    event = "VimEnter",
    config = [[require('config.lualine')]],
    requires = {
      "arkav/lualine-lsp-progress",
      { "kyazdani42/nvim-web-devicons", opt = true },
    }
  })

  use({
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
      require("config.colorizer")
    end,
  })

  use({
    "folke/trouble.nvim",
    event = "BufReadPre",
    wants = "nvim-web-devicons",
    cmd = { "TroubleToggle", "Trouble" },
    config = function()
      require("trouble").setup({ auto_open = false })
    end,
  })

  use({ "mbbill/undotree", cmd = "UndotreeToggle" })

  --use({ "darrikonn/vim-gofmt" })
  use({
    "ray-x/go.nvim",
    wants = "nvim-lspconfig",
    requires = "neovim/nvim-lspconfig",
    config = function()
      require("config.go")
    end,
  })

  use({
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function()
      require("config.keys")
    end,
  })

  use({
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    config = function()
      require("config.diffview")
    end,
  })

  use({ 
    "nvim-neorg/neorg",
    config = function()
      require("config.neorg")
    end,
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-neorg/neorg-telescope"
    }
  })
end

return packer.setup(config, plugins)
