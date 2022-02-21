return function()
  local status_ok, toggleterm = pcall(require, "toggleterm")
  if not status_ok then
    return
  end

  -- local util = require("util")
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
    },
  })
end
