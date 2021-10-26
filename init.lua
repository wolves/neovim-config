-- WLVS

-- Bootstrap Packer
if require "wlvs.first_load"() then
  return
end

-- Leader <space>
-- Map Leader out of the gate to its in place for all future maps
vim.g.mapleader = " "

-- Global variables needed in things after this
-- vim.g.snippets = "luasnip"

-- Setup Globals that need to always be available
require "wlvs.globals"

-- Place to disable unused builtin plugins
require "wlvs.disable_builtin"

-- Force Astronauta (Lua Keymaps) to load first
-- vim.cmd [[runtime plugin/astronauta.vim]]

require "util"

require "wlvs.lsp"
require "wlvs.telescope.setup"
require "wlvs.telescope.mappings"
-- require "wlvs"
