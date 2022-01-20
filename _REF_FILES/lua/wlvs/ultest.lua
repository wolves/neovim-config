vim.g["test#go#runner"] = "richgo"
vim.g.ultest_virtual_text = 0

vim.g.ultest_pass_sign = " "
vim.g.ultest_fail_sign = " "
vim.g.ultest_running_sign = " "

vim.g.ultest_pass_text = " "
vim.g.ultest_fail_text = " "
vim.g.ultest_running_text = " "

vim.cmd([[
  augroup _wlvs_ul_test
    au!
    au BufWritePost *_test.* UltestNearest
    augroup end
]])

local ok, wk = pcall(require, "which-key")
if ok then
  local opts = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
  }

  local mappings = {
    t = {
      o = { "<cmd>UltestOutput<CR>", "Test Output"}
    }
  }
  wk.register(mappings, opts)
end
