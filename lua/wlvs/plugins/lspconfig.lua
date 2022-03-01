wlvs.lsp = {}
local fmt = string.format

-----------------------------------------------------------------------------//
-- Autocommands
-----------------------------------------------------------------------------//
local function setup_autocommands(client, _)
  if client and client.resolved_capabilities.code_lens then
    wlvs.augroup('LspCodeLens', {
    {
        events = { 'BufEnter', 'CursorHold', 'InsertLeave' },
        targets = { '<buffer>' },
        command = vim.lsp.codelens.refresh,
      },
    })
  end
  if client and client.resolved_capabilities.document_highlight then
    wlvs.augroup('LspCursorCommands', {
    {
        events = { 'CursorHold' },
        targets = { '<buffer>' },
        command = vim.lsp.buf.document_highlight,
      },
    {
        events = { 'CursorHoldI' },
        targets = { '<buffer>' },
        command = vim.lsp.buf.document_highlight,
      },
    {
        events = { 'CursorMoved' },
        targets = { '<buffer>' },
        command = vim.lsp.buf.clear_references,
      },
    })
  end
  if client and client.resolved_capabilities.document_formatting then
    -- format on save
    wlvs.augroup('LspFormat', {
    {
        events = { 'BufWritePre' },
        targets = { '<buffer>' },
        command = function()
          -- BUG: folds are are removed when formatting is done, so we save the current state of the
          -- view and re-apply it manually after formatting the buffer
          -- @see: https://github.com/nvim-treesitter/nvim-treesitter/issues/1424#issuecomment-909181939
          vim.cmd 'mkview!'
          local ok, msg = pcall(vim.lsp.buf.formatting_sync, nil, 2000)
          if not ok then
            vim.notify(fmt('Error formatting file: %s', msg))
          end
          vim.cmd 'loadview'
        end,
      },
    })
  end
end

-----------------------------------------------------------------------------//
-- Mappings
-----------------------------------------------------------------------------//

---Setup mapping when an lsp attaches to a buffer
---@param client table lsp client
local function setup_mappings(client)
end

function wlvs.lsp.on_attach(client, bufnr)
  setup_autocommands(client, bufnr)
  setup_mappings(client)

  if client.resolved_capabilities.goto_definition then
    vim.bo[bufnr].tagfunc = 'v:lua.wlvs.lsp.tagfunc'
  end
end

-----------------------------------------------------------------------------//
-- Language servers
-----------------------------------------------------------------------------//

--- LSP server configs are setup dynamically as they need to be generated during
--- startup so things like runtimepath for lua is correctly populated
wlvs.lsp.servers = {
  bashls = true,
  cssls = true,
  html = true,
  gopls = {analyses = {unusedparams = false}, staticcheck = true},
  jsonls = function()
    return {
      settings = {
        json = {
          schemas = require('schemastore').json.schemas(),
        },
      },
    }
  end,
  yamlls = {},
  sumneko_lua = function()
    return {
      settings = {
        Lua = {
          diagnostics = {
            globals = {
              'vim',
              'describe',
              'it',
              'before_each',
              'after_each',
              'pending',
              'teardown',
              'packer_plugins',
            },
          },
          completion = { keywordSnippet = 'Replace', callSnippet = 'Replace' },
        },
      },
    }
  end,
}

---Logic to (re)start installed language servers for use initialising lsps
---and restarting them on installing new ones
function wlvs.lsp.get_server_config(server)
  local nvim_lsp_ok, cmp_nvim_lsp = wlvs.safe_require 'cmp_nvim_lsp'
  local conf = wlvs.lsp.servers[server.name]
  local conf_type = type(conf)
  local config = conf_type == 'table' and conf or conf_type == 'function' and conf() or {}
  config.flags = { debounce_text_changes = 500 }
  config.on_attach = wlvs.lsp.on_attach
  config.capabilities = config.capabilities or vim.lsp.protocol.make_client_capabilities()
  if nvim_lsp_ok then
    cmp_nvim_lsp.update_capabilities(config.capabilities)
  end
  return config
end

return function()
  local lsp_installer = require 'nvim-lsp-installer'
  lsp_installer.on_server_ready(function(server)
    server:setup(wlvs.lsp.get_server_config(server))
    vim.cmd [[ do User LspAttachBuffers ]]
  end)
end
