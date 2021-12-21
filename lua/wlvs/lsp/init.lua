require("wlvs.lsp.diagnostics").setup()
require("wlvs.lsp.kind").setup()


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
  cssls = require("wlvs.lsp.settings.cssls"),
  dockerls = {},
  gopls = require("wlvs.lsp.settings.gopls"),
  html = {},
  jsonls = require("wlvs.lsp.settings.jsonls"),
  sumneko_lua = require("wlvs.lsp.settings.sumneko_lua"),
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
