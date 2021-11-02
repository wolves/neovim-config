vim.opt.completeopt = {"menu", "menuone", "noselect" }

vim.opt.shortmess:append "c"

local lspkind = require "lspkind"
local cmp = require("cmp")

local function setup()
  cmp.setup {
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
      { name = "nvim_lsp", priority = 10 },
      { name = "nvim_lua" },
      { name = "path" },
      { name = "vsnip" },
      { name = "buffer", keyword_length = 5, max_item_count = 15 },
    },

    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },

    formatting = {
      format = lspkind.cmp_format {
        with_text = true,
        menu = {
          buffer = "[buf]",
          nvim_lsp = "[lsp]",
          path = "[path]",
          nvim_lua = "[api]",
          vsnip = "[snip]"
        },
      },
    },

    experimental = {
      native_menu = false,
      ghost_text = true,
    },

  }
end

return {
  setup = setup
}
-- [[
-- " Disable cmp for a buffer
-- autocmd FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }
-- ]]
-- local snippets_paths = function()
--     local plugins = { "friendly-snippets" }
--     local paths = {}
--     local path
--     local root_path = vim.env.HOME .. '/.vim/plugged/'
--     for _, plug in ipairs(plugins) do
--         path = root_path .. plug
--         if vim.fn.isdirectory(path) ~= 0 then
--             table.insert(paths, path)
--         end
--     end
--     return paths
-- end

-- require("luasnip.loaders.from_vscode").lazy_load({
--     -- paths = snippets_paths(),
--     paths = { "friendly-snippets" },
--     include = nil,  -- Load all languages
--     exclude = {}
-- })


-- return M
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
