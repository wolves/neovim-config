return function()
  local status_ok, kanagawa = pcall(require, 'kanagawa')
  if not status_ok then
    return
  end

  local default_clrs = require('kanagawa.colors').setup()

  kanagawa.setup {
    undercurl = true, -- enable undercurls
    commentStyle = 'italic',
    functionStyle = 'NONE',
    keywordStyle = 'italic',
    statementStyle = 'bold',
    typeStyle = 'NONE',
    variablebuiltinStyle = 'italic',
    specialReturn = true, -- special highlight for the return keyword
    specialException = true, -- special highlight for exception handling keywords
    transparent = false, -- do not set background color
    colors = {},
    overrides = {
      CursorLine = { bg = default_clrs.winterBlue },
    },
  }

  vim.cmd 'colorscheme kanagawa'
end
