local wk = require("which-key")
local util = require("util")

vim.o.timeoutlen = 300

local presets = require("which-key.plugins.presets")
presets.objects["a("] = nil
wk.setup({ show_help = false, triggers = "auto", plugins = { spelling = true }, key_labels = { ["<leader>"] = "SPC" } })

util.inoremap("<C-c>", "<esc>")

util.nnoremap('<C-t><C-t>', ':split term://go test -v<CR>')
util.nnoremap('<C-t><C-t><C-b>', ':split term://go test -bench=.<CR>')
