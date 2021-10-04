local util = require("util")
local cmp = require("cmp")
vim.o.completeopt = "menuone,noselect"

cmp.setup({
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = "always", -- changed to "enable" to prevent auto select
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  },

  mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),

    ['<C-<Space>'] = cmp.mapping.complete(),

  },

  sources = {
    { name = "buffer" },
    { name = "path" },
    { name = "nvim_lsp" },
    { name = "neorg" },
  },

})


-- util.inoremap("<C-Space>", "cmp#complete()", { expr = true })
-- util.inoremap("<C-e>", "cmp#close('<C-e>')", { expr = true })

-- local function complete()
--   if vim.fn.pumvisible() == 1 then
--     return vim.fn["cmp#confirm"]({ keys = "<cr>", select = true })
--   end
-- end
-- 
-- util.imap("<CR>", complete, { expr = true })
-- vim.cmd([[autocmd User CompeConfirmDone silent! lua vim.lsp.buf.signature_help()]])
