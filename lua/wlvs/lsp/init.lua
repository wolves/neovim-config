local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("wlvs.lsp.lsp-installer")
require("wlvs.lsp.handlers").setup()
require("wlvs.lsp.null-ls")
