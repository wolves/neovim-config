local has_lsp, _ = pcall(require, "lspconfig")
if not has_lsp then
  return
end

-- local lspconfig_util = require("lspconfig.util")

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

local M = {}

M.servers = function()
  return servers
end

require("lua-dev").setup()

M.get_server_config = function(server)
  local nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  local conf = servers[server.name] or {}
  local conf_type = type(conf)
  local config = conf_type == "table" and conf or conf_type == "function" and conf() or {}

  if nvim_lsp_ok then
    config.capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
  end

  config.on_attach = on_attach
  config.capabilities = config.capabilities or vim.lsp.protocol.make_client_capabilities()
  config.flags = { debounce_text_changes = 200 }

  return config
end

-- require("wlvs.lsp.lsp-signature")
require("wlvs.lsp.null-ls").setup(M.get_server_config({}))

return M
