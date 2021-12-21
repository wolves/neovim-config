local status_ok, go_nvim = pcall(require, "go")
if not status_ok then
  return
end

go_nvim.setup{
  lsp_cfg = {
    flags = {
      allow_incremental_sync = true,
      debounce_text_changes = 150,
    }
  },
  lsp_gofumpt = true
}

return require("go.lsp").config()
