local status_ok, tokyonight = pcall(require, "tokyonight")
if not status_ok then
	return
end

vim.o.background = "dark"
vim.g.tokyonight_style = "storm"

vim.g.tokyonight_sidebars = {
  "qf",
  -- "vista_kind",
  "terminal",
  "packer",
  -- "spectre_panel",
  "NeogitStatus",
  "help",
}

vim.g.tokyonight_cterm_colors = false
vim.g.tokyonight_terminal_colors = true
vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_italic_keywords = true
vim.g.tokyonight_italic_functions = false
vim.g.tokyonight_italic_variables = false
vim.g.tokyonight_transparent = false
vim.g.tokyonight_hide_inactive_statusline = false
vim.g.tokyonight_dark_sidebar = true
vim.g.tokyonight_dark_float = true
vim.g.tokyonight_colors = {}
vim.g.tokyonight_lualine_bold = false
-- vim.g.tokyonight_colors = { border = "orange" }

tokyonight.colorscheme()

-- vim.cmd [[
-- try
--   colorscheme darkplus
-- catch /^Vim\%((\a\+)\)\=:E185/
--   colorscheme default
--   set background=dark
-- endtry
-- ]]
