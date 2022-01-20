local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

local util = require("util")
local round = function(num)
  return math.floor(num + 0.5)
end

toggleterm.setup({
  size = 12,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "float",
  close_on_exit = false,
  shell = vim.o.shell,
  float_opts = {
    border = "curved",
    height = round(vim.opt.lines:get() * 0.9),
    width = round(vim.opt.columns:get() * 0.45),
    col = vim.opt.columns:get() * 0.54,
    row = vim.opt.lines:get() * 0.05,
    winblend = 6,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal
-- local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
--
-- function _LAZYGIT_TOGGLE()
--   lazygit:toggle()
-- end

local goterm = function(go_cmd)
  return Terminal:new({
    cmd = go_cmd,
    direction = "float",
    on_open = function(term)
      vim.cmd("startinsert!")
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    end,
    on_close = function(_)
      util.info("Closing terminal", "Go Test")
    end,
    on_exit = function(_, _, name)
      print(name)
      vim.cmd("stopinsert!")
    end,
  })
end

function _GO_RUN_TESTS()
  goterm("richgo test ./... -v -cover"):toggle()
end

function _GO_RUN_RACE_TESTS()
  goterm("richgo test ./... -v -cover -race"):toggle()
end

-- local node = Terminal:new({ cmd = "node", hidden = true })
--
-- function _NODE_TOGGLE()
--   node:toggle()
-- end

local btm = Terminal:new({ cmd = "btm", hidden = true })

function _BTM_TOGGLE()
  btm:toggle()
end
