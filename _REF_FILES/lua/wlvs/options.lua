-- vim.opt. them directly if they are installed, otherwise disable them. To avoid the then
-- runtime check cost, which can be slow.
-- Python This must be here becasue it makes loading vim VERY SLOW otherwise
vim.g.python_host_skip_check = 1
-- Disable python2 provider
vim.g.loaded_python_provider = 0

vim.g.python3_host_skip_check = 1

if vim.fn.executable("python3") == 1 then
  vim.g.python3_host_prog = vim.fn.exepath("python3")
else
  vim.g.loaded_python3_provider = 0
end

if vim.fn.executable("neovim-node-host") == 1 then
  vim.g.node_host_prog = vim.fn.exepath("neovim-node-host")
else
  vim.g.loaded_node_provider = 0
end

if vim.fn.executable("neovim-ruby-host") == 1 then
  vim.g.ruby_host_prog = vim.fn.exepath("neovim-ruby-host")
else
  vim.g.loaded_ruby_provider = 0
end

vim.g.loaded_perl_provider = 0

local options = {
  backup = false, -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 1, -- more space in the neovim command line for displaying messages
  colorcolumn = "100",
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0, -- so that `` is visible in markdown files
  errorbells = false,
  visualbell = false,
  fileencoding = "utf-8", -- the encoding written to a file
  hidden = true, -- allow modified buffers to be hidden
  hlsearch = false, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search patterns
  inccommand = "split", -- real time preview of substitution commands
  mouse = "a", -- allow the mouse to be used in neovim
  pumheight = 10, -- pop up menu height
  showmode = false, -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2, -- always show tabs
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- creates a swapfile
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 100, -- time to wait for a mapped sequence to complete (in milliseconds)
  undodir = "/Users/cstingl/.vim/undodir",
  undofile = true, -- enable persistent undo
  updatetime = 50, -- faster completion (4000ms default)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  softtabstop = 2,
  tabstop = 2, -- insert 2 spaces for a tab
  cursorline = true, -- highlight the current line
  number = true, -- set numbered lines
  relativenumber = true, -- set relative numbered lines
  numberwidth = 4, -- set number column width to 2 {default 4}
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  wildmode = "longest:full,full",
  wrap = false, -- display lines as one long line
  scrolloff = 10, -- is one of my fav
  sidescrolloff = 10,
  guifont = "Hack Nerd Font Mono:h14", -- the font used in graphical neovim applications
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work
