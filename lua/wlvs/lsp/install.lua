local util = require("util")

local M = {}

function M.install_missing(servers)
  local lspi_servers = require("nvim-lsp-installer.servers")
  for server, _ in pairs(servers) do
    local ok, s = lspi_servers.get_server(server)
    if ok then
      if not s:is_installed() then
        s:install()
      end
    else
      util.error("Server " .. server .. " not found")
    end
  end
end

function M.setup(servers)
  local status_ok, lspi = pcall(require, "nvim-lsp-installer")
  if not status_ok then
    return
  end

  lspi.on_server_ready(function(server)
    local opts = require("wlvs.lsp").get_server_config(server)

    if server.name == "gopls" then
      opts.flags = { allow_incremental_sync = true, debounce_text_changes = 200 }
    end

    server:setup(opts)
    vim.cmd([[ do User LspAttachBuffers ]])
  end)

  M.install_missing(servers)
end

return M
