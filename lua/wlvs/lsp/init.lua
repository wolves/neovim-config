local util = require("util")

local has_lsp, lspconfig = pcall(require, "lspconfig")
if not has_lsp then
  return
end

local lspconfig_util = require "lspconfig.util"

local nvim_status = require 'lsp-status'

local telescope_mapper = require "wlvs.telescope.mappings"
-- local handlers = require "wlvs.lsp.handlers"

local lspkind = require 'lspkind'
local status = require 'wlvs.lsp.status'
-- local null_ls = require 'null-ls'

local lsp = vim.lsp

lspkind.init()
status.activate()

local custom_init = function(client)
  client.config.flags = client.config.flags or {}
  client.config.flags.allow_incremental_sync = true
end

local filetype_attach = setmetatable({
  go = function(_)
    vim.cmd [[
      augroup lsp_buf_format
        au! BufWritePre <buffer>
        autocmd BufWritePre <buffer> :lua vim.lsp.buf.formatting_sync()
      augroup END
    ]]
  end,

}, {
  __index = function()
    return function() end
  end,
})

local custom_attach = function(client)
  local filetype = vim.api.nvim_buf_get_option(0, "filetype")

  nvim_status.on_attach(client)

  util.nnoremap("<space>cr", ":lua vim.lsp.buf.rename()<CR>", {buffer = 0})
  telescope_mapper("<space>ca", "lsp_code_actions", nil, true)

  util.nnoremap("gd", ":lua vim.lsp.buf.definition()<CR>", {buffer = 0})
  util.nnoremap("gD", ":lua vim.lsp.buf.declaration()<CR>", {buffer = 0})
  util.nnoremap("gT", ":lua vim.lsp.buf.type_definition()<CR>", {buffer = 0})

  -- util.nnoremap("<space>gI", handlers.implementation, {buffer = 0})
  util.nnoremap("<space>lr", ":lua R('wlvs.lsp.codelens').run()<CR>", {buffer=0})
  util.nnoremap("<space>rr", "<cmd>LspRestart<CR>", {buffer=0})

  telescope_mapper("gr", "lsp_references", nil, true)
  telescope_mapper("gI", "lsp_implementations", nil, true)
  telescope_mapper("<space>wd", "lsp_document_symbols", { ignore_filename = true }, true)
  telescope_mapper("<space>ww", "lsp_dynamic_workspace_symbols", { ignore_filename = true }, true)

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.cmd [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]
  end

  if client.resolved_capabilities.code_lens then
    vim.cmd [[
      augroup lsp_document_codelens
        au! * <buffer>
        autocmd BufWritePost,CursorHold <buffer> lua vim.lsp.codelens.refresh()
      augroup END
    ]]
  end

  -- Attach any filetype specific options to the client
  filetype_attach[filetype](client)
end

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

lsp.handlers['textDocument/publishDiagnostics'] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = {
    spacing = 4,
    prefix = "",
  },
  signs = true,
  update_in_insert = false,
  underline = true,
})

-- require('lsp_signature').setup { bind = true, handler_opts = { border = 'single' } }

local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
updated_capabilities = vim.tbl_deep_extend("keep", updated_capabilities, nvim_status.capabilities)
updated_capabilities.textDocument.codeLens = { dynamicRegistration = false }
updated_capabilities = require("cmp_nvim_lsp").update_capabilities(updated_capabilities)

local home = os.getenv 'HOME'
local system_name
if vim.fn.has 'mac' == 1 then
    system_name = 'macOS'
elseif vim.fn.has 'unix' == 1 then
    system_name = 'Linux'
end
local sumneko_root_path = home .. '/code/lua/lua-language-server'
local sumneko_binary = sumneko_root_path
    .. '/bin/'
    .. system_name
    .. '/lua-language-server'
local lua_cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' }
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

local servers = {
  cssls = {
    filetypes = { 'css', 'scss', 'less', 'sass' },
    root_dir = lspconfig.util.root_pattern('package.json', '.git'),
  },
  html = {},
  jsonls = {},
  sumneko_lua = {
    cmd = lua_cmd,
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
          path = runtime_path,
        },
        diagnostics = {
          globals = {'vim'},
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file('', true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
        completion = {
          keywordSnippet = "Disable"
        },
      },
    },
  },
  tsserver = {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },
  },
  gopls = {
    cmd = { "gopls" },
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
        linksInHover = false,
        codelenses = {
          generate = true,
          gc_details = true,
          regenerate_cgo = true,
          tidy = true,
          upgrade_depdendency = true,
          vendor = true,
        },
        usePlaceholders = true,
      },
    },
  },
}

local setup_server = function(server, config)
  if not config then
    return
  end

  if type(config) ~= "table" then
    config = {}
  end

  config = vim.tbl_deep_extend("force", {
    on_init = custom_init,
    on_attach = custom_attach,
    capabilities = updated_capabilities,
    flags = {
      debounce_text_changes = 50,
    },
  }, config)

  lspconfig[server].setup(config)
end

for server, config in pairs(servers) do
  setup_server(server, config)
end
