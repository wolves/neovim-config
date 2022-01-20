-- local themes = require("telescope.themes")

local M = {}

function M.telescope_projects()
  local opts = {
    path_display = { "smart" },
    winblend = 6,
    prompt_position = "bottom",
    layout_config = {
      width = 0.4,
      height = 0.4,
    },
  }

  require("telescope").extensions.projects.projects(opts)
end

function M.telescope_files()
  local options = {
    path_display = { "smart" },
    layout_strategy = "horizontal",
    layout_config = { preview_width = 0.50 },
  }

  if vim.fn.isdirectory(".git") ~= 0 then
    require("telescope.builtin").git_files(options)
  else
    require("telescope.builtin").find_files(options)
  end
end

function M.grep_prompt()
  require("telescope.builtin").grep_string({
    path_display = { "shorten" },
    search = vim.fn.input("Grep String ❱ "),
  })
end

function M.grep_word()
  require("telescope.builtin").grep_string({
    path_display = { "shorten" },
    search = vim.fn.expand("<cword>"),
  })
end

function M.help_tags()
  require("telescope.builtin").help_tags({
    show_version = true,
  })
end

require("wlvs.telescope.setup")

return M
