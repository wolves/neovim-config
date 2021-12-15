
local function setup()
  -- require("go.format").gofmt()  -- format only
  -- require("go.format").goimport()  -- goimport + gofmt

  require('go').setup {
    -- DEFAULTS
    --
    goimport='goimports', -- goimport command, can be gopls[default] or goimport
    gofmt = 'gofumpt', --gofmt cmd,
    max_line_len = 120, -- max line length in goline format
    tag_transform = false, -- tag_transfer  check gomodifytags for details
    test_template = '', -- default to testify if not set; g:go_nvim_tests_template  check gotests for details
    -- test_template_dir = '', -- default to nil if not set; g:go_nvim_tests_template_dir  check gotests for details
    -- comment_placeholder = '' ,  -- comment_placeholder your cool placeholder e.g. ﳑ       
    -- icons = {breakpoint = '🧘', currentpos = '🏃'},
    -- verbose = false,  -- output loginf in messages
    lsp_cfg = false, -- true: apply go.nvim non-default gopls setup, if it is a list, will merge with gopls setup e.g.
    --                  -- lsp_cfg = {settings={gopls={matcher='CaseInsensitive', ['local'] = 'your_local_module_path', gofumpt = true }}}
    lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
    -- lsp_on_attach = true, -- if a on_attach function provided:  attach on_attach function to gopls
    --                      -- true: will use go.nvim on_attach if true
    --                      -- nil/false do nothing
    -- lsp_codelens = true, -- set to false to disable codelens, true by default
    -- gopls_remote_auto = true, -- add -remote=auto to gopls
    -- gopls_cmd = nil, -- if you need to specify gopls path and cmd, e.g {"/home/user/lsp/gopls", "-logfile", "/var/log/gopls.log" }
    -- fillstruct = 'gopls', -- can be nil (use fillstruct, slower) and gopls
    -- lsp_diag_hdlr = true, -- hook lsp diag handler
    -- dap_debug = true, -- set to false to disable dap
    -- dap_debug_keymap = true, -- set keymaps for debugger
    -- dap_debug_gui = true, -- set to true to enable dap gui, highly recommand
    -- dap_debug_vt = true, -- set to true to enable dap virtual text
  }
-- Import on save
  vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
  -- vim.cmd("autocmd FileType go nmap <Leader><Leader>l GoLint")
  -- vim.cmd("autocmd FileType go nmap <Leader>gc :lua require('go.comment').gen()")
  vim.cmd("autocmd FileType go,gomod nmap <buffer><silent> <Leader>tt :GoTest ./... -v -cover<CR>:setf GoTest<CR>:resize +5<CR>")
  vim.cmd("autocmd FileType go,gomod nmap <buffer><silent> <Leader>tf :GoTestFile -v -cover<CR>:setf GoTest<CR>:resize +5<CR>")
  vim.cmd("autocmd FileType go,gomod nmap <buffer><silent> <Leader>tr :GoTest ./... -v -cover -race<CR>:setf GoTest<CR>:resize +5<CR>")

  -- vim.cmd([[
  -- augroup GoTestRunner
  -- au!
  -- au BufWritePost *_test.go GoTest -v -cover -race
  -- augroup END
  -- ]])
end

return {
  setup = setup
}
