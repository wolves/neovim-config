local has_lsp, lspconfig = pcall(require, "lspconfig")
if not has_lsp then
  return {}
end

local opts = {
  filetypes = { 'css', 'scss', 'less', 'sass' },
  root_dir = lspconfig.util.root_pattern('package.json', '.git'),
}

return opts
