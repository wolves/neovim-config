local config = {
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
    -- theme = 'onenord',
    component_separators = '|',
    section_separators = { left = '', right = '' },
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {
      -- { 'mode', separator = { left = ''}, right_padding = 2, fmt = function(str) return str:sub(1,1) end },
      { 'mode', separator = { left = ''}, right_padding = 2},
    },
    lualine_b = {
      {
        'diff',
        separator = {left = '', right = ''},
        color = {bg = '#1f2335'},
        always_visible = true
      },
      {'branch', separator = '', fmt = function(str) return str:sub(1,9) end },
    },
    lualine_c = {
      {'filename', path = 0, shorting_target = 50, separator = ''},
    },
    lualine_x = {},
    lualine_y = {
      {
        'filetype',
        separator = '',
      },
      {
        'diagnostics',
        sources = { 'nvim_lsp' },
        separator = {left = '', right = ''},
        sections = {'error', 'warn', 'hint'},
        symbols = { error = ' ', warn = ' ', info = ' ' },
        color = {bg = '#1f2335'},
        always_visible = true,
      },
    },
    lualine_z = {
      {
        'progress',
        icon = '',
        separator = { right = ''},
        left_padding = 0,
      },
    },
  },

  inactive_sections = {
    lualine_a = {
      {'filename', path = 1, shorting_target = 80},
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}


-- try to load matching lualine theme

local M = {}

function M.load()
  local name = vim.g.colors_name or ""
  local ok, _ = pcall(require, "lualine.themes." .. name)
  if ok then
    config.options.theme = name
  end
  require("lualine").setup(config)
end

M.load()

-- vim.api.nvim_exec([[
--   autocmd ColorScheme * lua require("config.lualine").load();
-- ]], false)

return M
--
-- local function clock()
--   return "◴ " .. os.date("%H:%M")
-- end

-- local function lsp_progress()
--   local messages = vim.lsp.util.get_progress_messages()
--   if #messages == 0 then
--     return
--   end
--   local status = {}
--   for _, msg in pairs(messages) do
--     table.insert(status, (msg.percentage or 0) .. "%% " .. (msg.title or ""))
--   end
--   local spinners = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
--   local ms = vim.loop.hrtime() / 1000000
--   local frame = math.floor(ms / 120) % #spinners
--   return table.concat(status, " | ") .. " " .. spinners[frame + 1]
-- end

-- vim.cmd([[autocmd User LspProgressUpdate let &ro = &ro]])

-- local config = {
--   options = {
--     theme = "tokyonight",
--     section_separators = { "", "" },
--     component_separators = { "", "" },
--     -- section_separators = { "", "" },
--     -- component_separators = { "", "" },
--     icons_enabled = true,
--   },
--   sections = {
--     lualine_a = { "mode" },
--     lualine_b = { "branch" },
--     lualine_c = { { "diagnostics", sources = { "nvim_lsp" } }, "filename" },
--     -- lualine_x = { "filetype", lsp_progress },
--     lualine_y = { "progress" },
--     lualine_z = { clock },
--   },
--   inactive_sections = {
--     lualine_a = {},
--     lualine_b = {},
--     lualine_c = {},
--     lualine_x = {},
--     lualine_y = {},
--     lualine_z = {},
--   },
--   -- extensions = { "nvim-tree" },
-- }
