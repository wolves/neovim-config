local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local mappings = {
  -- ["b"] = {
  --   "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
  --   "Buffers",
  -- }
  ["e"] = {"<cmd>NvimTreeToggle<cr>", "Explorer"},
  ["w"] = {"<cmd>w!<cr>", "Save"},
  ["q"] = {"<cmd>q!<cr>", "Quit"},
  ["T"] = {"<cmd>Trouble<cr>", "Trouble"},
  -- ["P"] = { "<cmd>Telescope projects<cr>", "Projects"},
  b = {
    name = "Buffers",
    b = {
      "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
      "Select Buffer",
    },
    d = {"<cmd>Bdelete<cr>", "Delete Buffer"},
  },
  g = {
    name = "Git",
    g = {"<cmd>Neogit<cr>", "Neogit"},
    j = {"<cmd>lua require('gitsigns').next_hunk()<cr>", "Next Hunk"},
    k = {"<cmd>lua require('gitsigns').prev_hunk()<cr>", "Prev Hunk"},
    l = {"<cmd>lua require('gitsigns').blame_line()<cr>", "Blame"},
    p = {"<cmd>lua require('gitsigns').preview_hunk()<cr>", "Preview Hunk"},
    r = {"<cmd>lua require('gitsigns').reset_hunk()<cr>", "Reset Hunk"},
    s = {"<cmd>lua require('gitsigns').stage_hunk()<cr>", "Stage Hunk"},
    u = {"<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", "Undo Stage Hunk"},
  },
  h = {
    name = "Help",
    ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
    p = {
      name = "Packer",
      c = {"<cmd>PackerCompile<cr>", "Packer compile"},
      p = {"<cmd>PackerSync<cr>", "Packer sync"},
    },
    v = {"<cmd>lua require('wlvs.telescope').help_tags()<cr>", "Help docs"},
  },
  p = {
    name = "Project",
    p = {"<cmd>Telescope projects<cr>", "Select a project"},
    s = {"<cmd>lua require('wlvs.telescope').grep_prompt()<cr>", "Grep string"},
    w = {"<cmd>lua require('wlvs.telescope').grep_word()<cr>", "Grep word"},
    g = {
      name = "Git",
      b = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
      c = {"<cmd>Telescope git_commits<cr>", "Checkout commit"},
      s = {"<cmd>Telescope git_status<cr>", "Open changed file"},
    },
    t = {"<cmd>TodoTelescope<cr>", "Todo Telescope"},
  }
}

vim.api.nvim_set_keymap("n", "<C-p>", "<cmd>lua require('wlvs.telescope').telescope_files()<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("i", "<C-c>", "<ESC>", {silent = true, noremap = true})

which_key.setup(setup)
which_key.register(mappings, opts)
