local cmd = vim.cmd
local indent = 2

--cmd 'colorscheme gruvbox'

vim.g.mapleader = " "
-- vim.g.gruvbox_contrast_dark = 'medium'
-- vim.g.gruvbox_contrast_light = 'medium'
-- vim.g.gruvbox_invert_selection = 0
vim.g.termguicolors = true

vim.opt.backup = false
vim.opt.cmdheight = 1
vim.opt.colorcolumn = "100"
vim.opt.errorbells = false
vim.opt.expandtab = true
vim.opt.guicursor={}
vim.opt.guifont = "Hack Nerd Font Mono:h14"
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.shiftwidth = indent
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = indent
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = indent
vim.opt.swapfile = false
vim.opt.undodir = "/Users/cstingl/.vim/undodir"
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.wildmode = "longest:full,full"
vim.opt.wrap = false

vim.g.completion_chain_complete_list = {
	default = {
		{ complete_items = { "lsp", "path", "buffers", "snippet" } },
		{ mode = "<c-p>" },
		{ mode = "<c-n>" },
	},
	TelescopePrompt = {},
	--frecency = {},
}

cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Check if we need to reload the file when it changed
cmd("au FocusGained * :checktime")

-- go to last loc when opening a buffer
cmd([[
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
]])

-- Highlight on yank
cmd("au TextYankPost * lua vim.highlight.on_yank {}")

-- windows to close with "q"
vim.cmd([[autocmd FileType help,startuptime,qf,lspinfo nnoremap <buffer><silent> q :close<CR>]])
vim.cmd([[autocmd FileType man nnoremap <buffer><silent> q :quit<CR>]])
vim.cmd([[autocmd FileType GoTest nnoremap <buffer><silent> q :bd<CR>]])
