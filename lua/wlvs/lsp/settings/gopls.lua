local status_ok, go_nvim = pcall(require, "go")
if not status_ok then
  return
end

go_nvim.setup({
  lsp_gofumpt = true,
  lsp_diag_hdlr = false,
  test_runner = "richgo",
})

vim.cmd([[
  augroup _wlvs_go_autocommands
    autocmd!
    autocmd FileType GoTest nnoremap <buffer><silent> q :Bdelete!<CR>
    autocmd BufWritePre *.go :silent! lua require('go.format').goimport() 
    augroup end
]])

return require("go.lsp").config()
