local wk = require("which-key")
local util = require("util")

vim.o.timeoutlen = 300

local presets = require("which-key.plugins.presets")
presets.objects["a("] = nil
wk.setup({ show_help = false, triggers = "auto", plugins = { spelling = true }, key_labels = { ["<leader>"] = "SPC" } })

util.inoremap("<C-c>", "<esc>", {silent = true})

-- Switch buffers with tab
util.nnoremap("<tab>", ":bnext<cr>")
util.nnoremap("<S-tab>", ":bprevious<cr>")

-- better indenting
util.vnoremap("<", "<gv")
util.vnoremap(">", ">gv")

vim.cmd(":command WQ wq")
vim.cmd(":command Wq wq")
vim.cmd(":command W w")
vim.cmd(":command Q q")

local leader = {
  ["w"] = {
    name = "+windows",
    ["w"] = { "<C-W>p", "other-window" },
    ["d"] = { "<C-W>c", "delete-window" },
    ["h"] = { "<C-W>h", "window-left" },
    ["j"] = { "<C-W>j", "window-below" },
    ["l"] = { "<C-W>l", "window-right" },
    ["k"] = { "<C-W>k", "window-up" },
    ["H"] = { "<C-W>5<", "expand-window-left" },
    ["J"] = { ":resize +5", "expand-window-below" },
    ["L"] = { "<C-W>5>", "expand-window-right" },
    ["K"] = { ":resize -5", "expand-window-up" },
    ["="] = { "<C-W>=", "balance-window" },
    ["-"] = { "<C-W>s", "split-window-below" },
    ["s"] = { "<C-W>s", "split-window-below" },
    ["|"] = { "<C-W>v", "split-window-right" },
    ["v"] = { "<C-W>v", "split-window-right" },
  },
  b = {
    name = "+buffer",
    ["b"] = { "<cmd>:e #<cr>", "Switch to Other Buffer" },
    ["p"] = { "<cmd>:BufferLineCyclePrev<CR>", "Previous Buffer" },
    ["["] = { "<cmd>:BufferLineCyclePrev<CR>", "Previous Buffer" },
    ["n"] = { "<cmd>:BufferLineCycleNext<CR>", "Next Buffer" },
    ["]"] = { "<cmd>:BufferLineCycleNext<CR>", "Next Buffer" },
    ["d"] = { "<cmd>:bd<CR>", "Delete Buffer" },
    ["g"] = { "<cmd>:BufferLinePick<CR>", "Goto Buffer" },
  },
  g = {
    name = "+git",
    g = { "<cmd>Neogit<CR>", "NeoGit" },
    c = { "<Cmd>Telescope git_commits<CR>", "commits" },
    b = "Branches",
    s = { "<Cmd>Telescope git_status<CR>", "status" },
    -- d = { "<cmd>DiffviewOpen<cr>", "DiffView" },
  },
  ["h"] = {
    name = "+help",
    p = {
      name = "+packer",
      p = { "<cmd>PackerSync<cr>", "Sync" },
      s = { "<cmd>PackerStatus<cr>", "Status" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      c = { "<cmd>PackerCompile<cr>", "Compile" },
    },
  },
  u = { "<cmd>UndotreeToggle<CR>", "Undo Tree" },
  p = {
    name = "+project",
    f = "File Browser",
    p = "Open Project",
    b = "Buffers",
    s = "Grep String",
    w = "Grep Word",
  },
  v = {
    name = "+neovim",
    n = "Org Notes",
    h = "Help Docs"
  }
}

wk.register(leader, { prefix = "<leader>" })
