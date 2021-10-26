require("neogit").setup({
  signs = {
    -- { CLOSED, OPENED }
    section = { "", "" },
    item = { "", "" },
    hunk = { "", "" },
  },
})

local util = require("util")

util.nnoremap('<Leader>ng', ':Neogit<CR>')
