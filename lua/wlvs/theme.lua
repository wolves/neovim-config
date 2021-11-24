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

require("tokyonight").colorscheme()

-- local onenord = require "onenord"
-- local colors = require "onenord.colors"
-- vim.o.termguicolors = true
-- -- vim.o.background = "dark"

-- onenord.setup({
--   borders = true, -- Split window borders
--   italics = {
--     comments = true, -- Italic comments
--     strings = false, -- Italic strings
--     keywords = true, -- Italic keywords
--     functions = false, -- Italic functions
--     variables = false, -- Italic variables
--   },
--   disable = {
--     background = false, -- Disable setting the background color
--     cursorline = false, -- Disable the cursorline
--     eob_lines = true, -- Hide the end-of-buffer lines
--   },
--   custom_highlights = {
--     TSConstructor = { fg = colors.dark_blue },
--   }, -- Overwrite default highlight groups
-- })

-- vim.cmd [[colorscheme onenord]]
