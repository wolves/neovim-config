vim.cmd [[packadd packer.nvim]]
-- vim.cmd [[packadd vimball]]

local has = function(x)
  return vim.fn.has(x) == 1
end

local executable = function(x)
  return vim.fn.executable(x) == 1
end

return require("packer").startup {
  function(use)

    use "wbthomason/packer.nvim"

    use {
        'nvim-treesitter/nvim-treesitter',
        event = { 'BufRead', 'BufNewFile' },
        requires = {
            {
                'nvim-treesitter/nvim-treesitter-refactor',
                after = 'nvim-treesitter',
            },
            {
                'nvim-treesitter/nvim-treesitter-textobjects',
                after = 'nvim-treesitter',
            },
            {
                'lewis6991/spellsitter.nvim',
                after = 'nvim-treesitter',
                config = function()
                    require('spellsitter').setup {
                        hl = 'SpellBad',
                        captures = {},
                    }
                end,
                disable = true, -- not working for now
            },
        },
        run = ':TSUpdate',
        config = function()
            require('wlvs.treesitter').config()
        end,
    }
    use { 'neovim/nvim-lspconfig' }
    use { 'nvim-lua/lsp-status.nvim' }
    use { 'nvim-lua/lsp_extensions.nvim' }
    use { 'onsails/lspkind-nvim' }
    use { 'ray-x/lsp_signature.nvim' }

    use { 'L3MON4D3/LuaSnip' }

     -- Completion
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-nvim-lsp"
    use "saadparwaiz1/cmp_luasnip"
    -- use "tamago324/cmp-zsh"

    use { "nvim-lua/plenary.nvim" }
    use { "nvim-lua/popup.nvim" }

    use {
      "folke/lsp-trouble.nvim",
      cmd = "LspTrouble",
      config = function()
        -- Can use P to toggle auto movement
        require("trouble").setup {
          auto_preview = false,
          auto_fold = true,
        }
      end,
    }

    use {
      "nvim-telescope/telescope.nvim"
    }

    -- use {
    --   "nvim-telescope/telescope-frecency.nvim",
    --   after = { 'telescope.nvim' },
    --   requires = 'tami5/sql.nvim',
    -- }

    use {
      "nvim-telescope/telescope-fzy-native.nvim",
      after = { 'telescope.nvim' },
      config = function()
        require('telescope').load_extension("fzy_native")
      end,
    }

    -- PR Filter is:open is:pr review-requested:wolves archived:false
    use { 
      "nvim-telescope/telescope-github.nvim",
      after = { 'telescope.nvim' },
      config = function()
        require('telescope').load_extension("gh")
      end,
    }

    -- use {
      -- "nvim-telescope/telescope-symbols.nvim",
      -- after = { 'telescope.nvim' },
      -- config = function()
        -- require('telescope').load_extension("symbols")
      -- end,
    -- }
    -- use { "nvim-telescope/telescope-hop.nvim" }
    -- use { "nvim-telescope/telescope-packer.nvim" }
    -- use { "nvim-telescope/telescope-cheat.nvim" }
    -- use { "telescope-hacks.nvim" }
    -- use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    -- use { "nvim-telescope/telescope-fzf-writer.nvim" }

    use {
      "antoinemadec/FixCursorHold.nvim",
      run = function()
        vim.g.curshold_updatime = 1000
      end,
    }

    --
    -- COLORSCHEME:

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
        require("wlvs.theme")
      end,
    })

    -- VIM EDITOR:

    -- Little know features:
    --   :SSave
    --   :SLoad
    --       These are wrappers for mksession that work great. I never have to use
    --       mksession anymore or worry about where things are saved / loaded from.
    use {
      "mhinz/vim-startify",
      cmd = { "SLoad", "SSave" },
      config = function()
        vim.g.startify_disable_at_vimenter = true
      end,
    }

    -- Quickfix enhancements. See :help vim-qf
    use { "romainl/vim-qf" }

    use { "kyazdani42/nvim-tree.lua" }

  --
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
     keys = "<C-t>",
     config = function()
       require("wlvs.terminal")
     end,
   })
 
   -- Smooth Scrolling
   use({
     "karb94/neoscroll.nvim",
     keys = {
       "<C-u>", "<C-d>", "gg", "G", "zz"
     },
     config = function()
       require("wlvs.scroll")
     end,
   })
 
   -- Statusline
   use({
     "hoob3rt/lualine.nvim",
     event = "VimEnter",
     config = function()
       require("wlvs.lualine")
     end,
     requires = {
       "arkav/lualine-lsp-progress",
       { "kyazdani42/nvim-web-devicons", opt = true },
     }
   })
 
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

  -- GO
  -- Testing out some options here. Need to determine the features I want...
  -- use({ "darrikonn/vim-gofmt" })
  use({
    "ray-x/go.nvim",
    wants = "nvim-lspconfig",
    requires = "neovim/nvim-lspconfig",
    ft = "go",
    config = function()
      require("wlvs.golang")
    end,
  })

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
    "iamcco/markdown-preview.nvim", 
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = "markdown",
    cmd = { "MarkdownPreview" },
  })

  use({
    "prettier/vim-prettier",
    ft = { "html", "javascript", "typescript" },
    run = "yarn install"
  })

  -- Completion
  -- use({
    -- "hrsh7th/nvim-cmp",
    -- config = function()
      -- require("wlvs.lsp.cmp")
    -- end,
    -- requires = {
    -- },
    -- run = function()
      -- "L3MON4D3/LuaSnip" 
      -- "hrsh7th/cmp-buffer"
      -- "hrsh7th/cmp-path"
      -- "hrsh7th/cmp-nvim-lua"
      -- "hrsh7th/cmp-nvim-lsp"
      -- "saadparwaiz1/cmp_luasnip"
    -- end,
  -- })


  -- TODO --
  -- use "rofl.nvim"
  -- use "hrsh7th/vim-vsnip"
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
  use "godlygeek/tabular" -- Quickly align text by pattern
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
  use {
    "AndrewRadev/splitjoin.vim",
    keys = { "gJ", "gS" },
  }

  -- TODO: Check out macvhakann/vim-sandwich - Quote: "TJ Devries"
  use "tpope/vim-surround" -- Surround text objects easily
--------------------------------------------------------------------------------
  --
  --
  -- WIP: GIT

  use({
    "TimUntersberger/neogit",
    cmd = "Neogit",
    config = function()
      require("wlvs.neogit")
    end,
  })

  -- Github integration
  if vim.fn.executable "gh" == 1 then
    use "pwntester/octo.nvim"
  end
  use "ruifm/gitlinker.nvim"

  -- Sweet message committer
  -- use "rhysd/committia.vim"

  use({
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    config = function()
      require("wlvs.diffview")
    end,
  })

  -- Floating windows are awesome :)
  -- use {
    -- "rhysd/git-messenger.vim",
    -- keys = "<Plug>(git-messenger)",
  -- }

  -- Git Gutter
  use({
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("wlvs.gitsigns")
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
  --
  --
  -- Markdown

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
  -- use "tjdevries/standard.vim"
  -- use "tjdevries/conf.vim"

  -- use { "junegunn/fzf", run = "./install --all" }
  -- use { "junegunn/fzf.vim" }

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

  end,

  config = {
    display = {
      -- open_fn = require("packer.util").float({ border = "single" })
    },
  },
}
