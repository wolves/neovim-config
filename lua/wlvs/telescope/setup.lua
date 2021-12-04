local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"


local set_prompt_to_entry_value = function(prompt_bufnr)
  local entry = action_state.get_selected_entry()
  if not entry or not type(entry) == "table" then
    return
  end

  action_state.get_current_picker(prompt_bufnr):reset_prompt(entry.ordinal)
end

local function setup ()
  require("telescope").setup {
    defaults = {
      prompt_prefix = " ❯ ",
      -- selection_caret = " ",
      selection_caret = "❯ ",

      winblend = 0,

      layout_strategy = "horizontal",
      layout_config = {
        width = 0.95,
        height = 0.85,
        prompt_position = "top",

        horizontal = {
          preview_width = function(_, cols, _)
            if cols > 200 then
              return math.floor(cols * 0.4)
            else
              return math.floor(cols * 0.6)
            end
          end,
        },

        vertical = {
          width = 0.9,
          height = 0.95,
          preview_height = 0.5,
        },

        flex = {
          horizontal = {
            preview_width = 0.9
          },
        },
      },

      selection_strategy = "reset",
      sorting_strategy = "descending",
      scroll_strategy = "cycle",
      color_devicons = true,
      mappings = {
        i = {
          ["<C-x>"] = false,
          -- ["<C-s>"] = actions.select_horizontal,
          ["<C-n>"] = "move_selection_next",

          ["<C-y>"] = set_prompt_to_entry_value,
        },
      },

      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },

      file_ignore_patterns = {
        'node_modules',
        '%.jpg',
        '%.jpeg',
        '%.png',
        '%.svg',
        '%.otf',
        '%.ttf',
      },
      file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    },

    extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                         -- the default case_mode is "smart_case"
      },
      project = {
        base_dirs = {
          '~/code/ruby/piq',
          '~/code/sunbird',
          {'~/code/go/github.com'},
        },
        hidden_files = true -- default
      },
      dash = {
        {
          -- configure path to Dash.app if installed somewhere other than /Applications/Dash.app
          dash_app_path = '/Applications/Dash.app',
          -- search engine to fall back to when Dash has no results, must be one of: 'ddg', 'duckduckgo', 'startpage', 'google'
          search_engine = 'ddg',
          -- debounce while typing, in milliseconds
          debounce = 0,
          -- map filetype strings to the keywords you've configured for docsets in Dash
          -- setting to false will disable filtering by filetype for that filetype
          -- filetypes not included in this table will not filter the query by filetype
          -- check src/lua_bindings/dash_config_binding.rs to see all defaults
          -- the values you pass for file_type_keywords are merged with the defaults
          -- to disable filtering for all filetypes,
          -- set file_type_keywords = false
          file_type_keywords = {
            dashboard = false,
            NvimTree = false,
            TelescopePrompt = false,
            terminal = false,
            packer = false,
            fzf = false,
            -- a table of strings will search on multiple keywords
            javascript = { 'javascript', 'nodejs' },
            typescript = { 'typescript', 'javascript', 'nodejs' },
            -- typescriptreact = { 'typescript', 'javascript', 'react' },
            -- javascriptreact = { 'javascript', 'react' },
            -- you can also do a string, for example,
            -- sh = 'bash'
          },
        }

        }
    },
  }
end


return {
  setup = setup
}


-- if vim.fn.executable "gh" == 1 then
--   pcall(require("telescope").load_extension, "gh")
--   pcall(require("telescope").load_extension, "octo")
-- end
