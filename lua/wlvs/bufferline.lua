local bufferline = require("bufferline")

bufferline.setup {
  options = {
    --mappings = true,
    show_close_icon = false,
    show_buffer_close_icons = false,
    diagnostics = "nvim_lsp",
    always_show_bufferline = false,
    separator_style = "thick",
    tab_size = "21",
    theme = 'tokyonight',
    --- count is an integer representing total count of errors
    --- level is a string "error" | "warning"
    --- diagnostics_dict is a dictionary from error level ("error", "warning" or "info")to number of errors for each level.
    --- this should return a string
    --- Don't get too fancy as this function will be executed a lot
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
    -- diagnostics_indicator = function(_, _, diagnostics_dict)
    --   local s = " "
    --   for e, n in pairs(diagnostics_dict) do
    --     local sym = e == "error" and " " or (e == "warning" and " " or "")
    --     s = s .. sym .. n
    --   end
    --   return s
    -- end,
  },
}
