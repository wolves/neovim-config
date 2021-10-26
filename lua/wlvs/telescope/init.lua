SHOULD_RELOAD_TELESCOPE = true

local reloader = function()
  if SHOULD_RELOAD_TELESCOPE then
    RELOAD "plenary"
    RELOAD "popup"
    RELOAD "telescope"
    RELOAD "wlvs.telescope.setup"
    -- RELOAD "wlvs.telescope.custom"
  end
end

local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local themes = require "telescope.themes"

local set_prompt_to_entry_value = function(prompt_bufnr)
  local entry = action_state.get_selected_entry()
  if not entry or not type(entry) == "table" then
    return
  end

  action_state.get_current_picker(prompt_bufnr):reset_prompt(entry.ordinal)
end

local _ = pcall(require, "nvim-nonicons")

local M = {}

function M.edit_neovim()
  local opt_with_preview, opts_without_preview

  opts_with_preview = {
    prompt_title = "~ dotfiles ~",
    shorten_path = false,
    cwd = "~/.config/nvim",

    layout_strategy = "flex",
    layout_config = {
      width = 0.9,
      height = 0.8,

      horizontal = {
        width = { padding = 0.15 },
      },
      vertical = {
        preview_height = 0.75,
      },
    },

    attach_mappings = function(_, map)
      map("i", "<c-y>", set_prompt_to_entry_value)
      map("i", "<M-c>", function(prompt_bufnr)
        actions.close(prompt_bufnr)
        vim.schedule(function()
          require("telescope.builtin").find_files(opts_without_preview)
        end)
      end)

      return true
    end,
  }

  opts_without_preview = vim.deepcopy(opts_with_preview)
  opts_without_preview.previewer = false
  require("telescope.builtin").file_browser(opts_with_preview)
end

function M.sunbird_piq()
  require("telescope.builtin").find_files {
    prompt_title = "› sunbird ‹",
    shorten_path = false,
    cwd = "~/code/ruby/poweriq_web/",

    layout_strategy = "horizontal",
    layout_config = {
      width = 0.95,
      preview_width = 0.65,
    },
  }
end

function M.sunbird_ui()
  require("telescope.builtin").find_files {
    prompt_title = "› sunbird UI ‹",
    shorten_path = false,
    cwd = "~/code/sunbird/seven_ui/",

    layout_strategy = "horizontal",
    layout_config = {
      width = 0.95,
      preview_width = 0.65,
    },
  }
end

function M.edit_dots()
  require("telescope.builtin").find_files {
    shorten_path = false,
    cwd = "~/.dotfiles/",
    prompt = "~ dotfiles ~",
    hidden = false,

    layout_strategy = "horizontal",
    layout_config = {
      preview_width = 0.55,
    },
  }
end

function M.edit_kitty()
  require("telescope.builtin").find_files {
    shorten_path = false,
    cwd = "~/.config/kitty/",
    prompt = "~ kitty ~",
    hidden = false,

    layout_strategy = "horizontal",
    layout_config = {
      preview_width = 0.55,
    },
  }
end

function M.telescope_files()
  local options = {
    path_display = {},
    layout_strategy = 'horizontal',
    layout_config = { preview_width = 0.65 },
  }

  if vim.fn.isdirectory '.git' ~= 0 then
    require("telescope.builtin").git_files(options)
  else
    require("telescope.builtin").find_files(options)
  end
end

function M.file_browser()
  local opts

  opts = {
    sorting_strategy = "ascending",
    scroll_strategy = "cycle",
    layout_config = {
      prompt_position = "top",
    },
  },

  require("telescope.builtin").file_browser(opts)
end

function M.grep_prompt()
  require("telescope.builtin").grep_string {
    path_display = { "shorten" },
    search = vim.fn.input "Grep String > ",
  }
end

function M.grep_word()
  require("telescope.builtin").grep_string {
    path_display = { "shorten" },
    search = vim.fn.expand('<cword>'),
  }
end

function M.buffers()
  require("telescope.builtin").buffers {
    shorten_path = false,
  }
end

function M.help_tags()
  require("telescope.builtin").help_tags {
    show_version = true,
  }
end

function M.git_status()
  local opts = themes.get_dropdown {
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false,
  }

  -- Can change the git icons using this.
  -- opts.git_icons = {
  --   changed = "M"
  -- }

  require("telescope.builtin").git_status(opts)
end

function M.git_commits()
  require("telescope.builtin").git_commits {
    winblend = 5,
  }
end

function M.git_branches()
  local opts = themes.get_dropdown {
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false,
  }

  require("telescope.builtin").git_branches(opts)
end

function M.builtin()
  require("telescope.builtin").builtin()
end

function M.lsp_code_actions()
  local opts = themes.get_dropdown {
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false,
  }

  require("telescope.builtin").lsp_code_actions(opts)
end

return M


