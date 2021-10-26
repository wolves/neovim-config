vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  require("lsp_extensions.workspace.diagnostic").handler,
  {
    signs = {
      severity_limit = "Error",
    },
    underline = {
      severity_limit = "Warning",
    },
    virtual_text = true,
  }
)

vim.lsp.handlers["window/showMessage"] = function(...)
  return R "wlvs.lsp.show_message"(...)
end
