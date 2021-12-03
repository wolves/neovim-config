local wk = require("which-key")
local util = require("util")

vim.o.timeoutlen = 300

local presets = require("which-key.plugins.presets")
presets.objects["a("] = nil
wk.setup({
  show_help = false,
  triggers = "auto",
  plugins = { spelling = true },
  key_labels = { ["<leader>"] = "SPC" },
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k", "<" },
    v = { "j", "k" },
  },
})

util.inoremap("<C-c>", "<esc>", {silent = true})

-- Switch buffers with tab
util.nnoremap("<tab>", ":bnext<cr>")
util.nnoremap("<S-tab>", ":bprevious<cr>")

-- better indenting
util.vnoremap("<", "<gv")
util.vnoremap(">", ">gv")

-- Vsnip
-- " NOTE: You can use other key to expand snippet.

-- " Expand
-- imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
-- smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

-- " Expand or jump
-- imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
-- smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

-- " Jump forward or backward
-- imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
-- smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
-- imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
-- smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

-- " Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
-- " See https://github.com/hrsh7th/vim-vsnip/pull/50
-- nmap        s   <Plug>(vsnip-select-text)
-- xmap        s   <Plug>(vsnip-select-text)
-- nmap        S   <Plug>(vsnip-cut-text)
-- xmap        S   <Plug>(vsnip-cut-text)

-- " If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
-- let g:vsnip_filetypes = {}
-- let g:vsnip_filetypes.javascriptreact = ['javascript']
-- let g:vsnip_filetypes.typescriptreact = ['typescript']
-- util.imap("C-l", "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)'")
-- util.smap("C-l", "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)'")
-- vim.api.nvim_set_keymap('i', "<expr> <Tab>", "vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)' : '<Tab>'", {silent=true})
vim.cmd("imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'")
vim.cmd("smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'")
vim.cmd("imap <expr> <S-Tab>   vsnip#jumpable(-1)   ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'")
vim.cmd("smap <expr> <S-Tab>   vsnip#jumpable(-1)   ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'")

vim.cmd(":command WQ wq")
vim.cmd(":command Wq wq")
vim.cmd(":command W w")
vim.cmd(":command Q q")

-- " Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
-- nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
-- nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
-- nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
-- nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

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
  },
  Z = { [[<cmd>lua require("zen-mode").reset()<cr>]], "Zen Mode" },
  z = { [[<cmd>ZenMode<cr>]], "Zen Mode" },
}

wk.register(leader, { prefix = "<leader>" })
