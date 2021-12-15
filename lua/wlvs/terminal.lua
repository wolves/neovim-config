require("toggleterm").setup({
  size = 20,
  hide_numbers = true,
  open_mapping = [[<C-t>]],
  shade_filetypes = {},
  shade_terminals = false,
  shading_factor = 0.3, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  persist_size = true,
  direction = "horizontal",
})

-- Hide number column for
-- vim.cmd [[au TermOpen * setlocal nonumber norelativenumber]]

-- Esc twice to get to normal mode
vim.cmd([[tnoremap <esc><esc> <C-\><C-N>]])
-- vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>TermExec cmd='go_test ./... -v -cover' go_back=0 start_in_insert=false<CR>", {noremap = true, silent = true})
-- local Terminal  = require('toggleterm.terminal').Terminal
-- local gotester = Terminal:new({
--   cmd = "go test ./... -v -cover",
--   dir = "~/code/go/github.com/wolves/gopherguides-intro-to-go/week11",
--   direction = "tab",
--   float_opts = {
--     border = "single",
--     width = vim.o.columns * 0.6,
--     -- height = <value>,
--     winblend = 8,
--     highlights = {
--       border = "Normal",
--       background = "Normal",
--     }
--   },
--   -- function to run on opening the terminal
--   on_open = function(term)
--     vim.cmd("startinsert!")
--     vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
--   end,
--   -- function to run on closing the terminal
--   on_close = function(term)
--     vim.cmd("Closing terminal")
--   end,
-- })

-- function _gotest_toggle()
--   gotester:toggle()
-- end


