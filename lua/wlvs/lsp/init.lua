require("wlvs.lsp.diagnostics").setup()
require("wlvs.lsp.kind").setup()

-- local filetype_attach = setmetatable({
--   go = function(_)
--     vim.cmd [[
--       augroup lsp_buf_format
--         au! BufWritePre <buffer>
--         autocmd BufWritePre <buffer> :lua vim.lsp.buf.formatting_sync()
--       augroup END
--     ]]
--   end,
--
-- }, {
--   __index = function()
--     return function() end
--   end,
-- })

-- local custom_attach = function(client)
--   local filetype = vim.api.nvim_buf_get_option(0, "filetype")
--
--   filetype_attach[filetype](client)
-- end

local function on_attach(client, bufnr)
  require("wlvs.lsp.formatting").setup(client, bufnr)
  require("wlvs.lsp.keys").setup(client, bufnr)
  require("wlvs.lsp.highlighting").setup(client)

  -- Typescript specific
  if client.name == "typescript" or client.name == "tsserver" then
    require("wlvs.lsp.ts-utils").setup(client)
  end
end

local servers = {
  ansiblels = {},
  bashls = {},
  cssls = {},
  dockerls = {},
  gopls = {},
  html = {},
  jsonls = {},
  sumneko_lua = {},
  tsserver = {},
  vimls = {},
  yamlls = {},
}

local options = {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  }
}

require("wlvs.lsp.null-ls").setup(options)
require("wlvs.lsp.install").setup(servers, options)
