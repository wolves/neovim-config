local util = require "util"
local sorters = require "telescope.sorters"

TelescopeMapArgs = TelescopeMapArgs or {}

local map_tele = function(key, f, options, buffer)
  local map_key = vim.api.nvim_replace_termcodes(key .. f, true, true, true)

  TelescopeMapArgs[map_key] = options or {}

  local mode = "n"
  local rhs = string.format("<cmd>lua R('wlvs.telescope')['%s'](TelescopeMapArgs['%s'])<CR>", f, map_key)

  local map_options = {
    noremap = true,
    silent = true,
  }

  if not buffer then
    vim.api.nvim_set_keymap(mode, key, rhs, map_options)
  else
    vim.api.nvim_buf_set_keymap(0, mode, key, rhs, map_options)
  end
end

-- Dotfiles
map_tele("<leader>en", "edit_neovim")
map_tele("<space>nr", "config_reload")

map_tele("<leader>ez", "edit_dots")
map_tele("<leader>ek", "edit_kitty")

-- Files
map_tele("<C-p>", "telescope_files")
map_tele("<space>pf", "file_browser")
map_tele("<space>ps", "grep_prompt")
map_tele("<space>fw", "grep_word")

-- Sunbird
map_tele("<space>sf", "sunbird_piq")
map_tele("<space>suf", "sunbird_ui")

-- Git
map_tele("<space>gs", "git_status")
map_tele("<space>gc", "git_commits")
map_tele("<space>gb", "git_branches")

-- Nvim
map_tele("<space>pb", "buffers")
map_tele("<space>vh", "help_tags")

-- map_tele("<space>tl", "todo_tele")

-- util.nnoremap("<space>tl", ":lua require'telescope'.extensions.project.project{}<CR>")
util.nnoremap("<space>pp", ":lua require'telescope'.extensions.project.project{}<CR>")



-- util.nnoremap("<Leader>vn", ":lua require('config.telescope').search_notes()<CR>")


return map_tele
