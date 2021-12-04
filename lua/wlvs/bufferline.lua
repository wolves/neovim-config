local bufferline = require("bufferline")
local groups = require("bufferline.groups")

bufferline.setup {
  options = {
    --mappings = true,
    show_close_icon = false,
    show_buffer_close_icons = false,
    diagnostics = "nvim_lsp",
    always_show_bufferline = true,
    separator_style = "thick",
    tab_size = "21",
    theme = 'tokyonight',
    --- count is an integer representing total count of errors
    --- level is a string "error" | "warning"
    --- diagnostics_dict is a dictionary from error level ("error", "warning" or "info")to number of errors for each level.
    --- this should return a string
    --- Don't get too fancy as this function will be executed a lot
    diagnostics_indicator = function(_, level, _, _)
      local icon = level:match("error") and " " or (level:match("warning") and " " or " ")
      return "" .. icon .. ""
    end,
    groups = {
      options = {
        toggle_hidden_on_enter = true -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
      },
      items = {
        groups.builtin.ungrouped,
        {
          name = "Tests", -- Mandatory
          -- highlight = {gui = "underline", guisp = "blue"}, -- Optional
          priority = 2, -- determines where it will appear relative to other groups (Optional)
          icon = "", -- Optional
          matcher = function(buf) -- Mandatory
            return buf.filename:match('%_test') or buf.filename:match('%_spec')
          end,
        },
        {
          name = "Notes",
          -- highlight = {gui = "undercurl", guisp = "green"},
          auto_close = false,  -- whether or not close this group if it doesn't contain the current buffer
          matcher = function(buf)
            return buf.filename:match('%.md') or buf.filename:match('%.txt')
          end,
          separator = { -- Optional
            style = require('bufferline.groups').separator.tab
          },
        }
      },
      custom_filter = function(buf, buf_nums)
        -- dont show help buffers in the bufferline
        if not vim.bo[buf].filetype == "help" then
          return true
        end

        -- you can use more custom logic for example
        -- don't show files matching a pattern
        -- return not vim.fn.bufname(buf):match('test')

        -- show only certain filetypes in certain tabs e.g. js in one, css in another etc.
        local tab_num = vim.fn.tabpagenr()
        if tab_num == 1 and vim.bo[buf].filetype == "javascript" then
          return true
        elseif tab_num == 2 and vim.bo[buf].filetype == "css" then
          return true
        else
          return false
        end




        -- My personal example:
        -- Don't show output log buffers in the same tab as my other code.
        -- 1. Check if there are any log buffers in the full list of buffers
        -- if not don't do any filtering
        local logs =
          vim.tbl_filter(
            function(b)
              return vim.bo[b].filetype == "log"
            end,
            buf_nums
          )
        if vim.tbl_isempty(logs) then
          return true
        end
        -- 2. if there are log buffers then only show the log buffer
        tab_num = vim.fn.tabpagenr()
        local is_log = vim.bo[buf].filetype == "log"
        -- only show log buffers in secondary tabs
        return (tab_num == 2 and is_log) or (tab_num ~= 2 and not is_log)
      end
    },
  },
}
