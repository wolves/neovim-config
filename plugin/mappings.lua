local nnoremap = wlvs.nnoremap
local inoremap = wlvs.inoremap

nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")

nnoremap("<ESC><ESC>", "<cmd>nohlsearch<CR>")

inoremap("<C-c>", "<ESC>")
