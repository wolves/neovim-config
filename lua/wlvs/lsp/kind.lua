local M = {}

M.icons = {
  Class = " ",
  Color = " ",
  Constant = " ",
  Constructor = " ",
  Enum = " ",
  EnumMember = " ",
  Field = " ",
  File = " ",
  Folder = " ",
  Function = " ",
  Interface = " ",
  Keyword = " ",
  Method = "m ",
  Module = " ",
  Property = " ",
  Snippet = "﬌ ",
  Struct = " ",
  Text = " ",
  Unit = " ",
  Value = " ",
  Variable = " ",
  Event = " ",
  Operator = " ",
  TypeParameter = " ",
  Reference = " ",
}

function M.cmp_format()
  return function(entry, vim_item)
    if M.icons[vim_item.kind] then
      vim_item.kind = M.icons[vim_item.kind] .. vim_item.kind
    end

    vim_item.menu = ({
      nvim_lsp = "[lsp]",
      luasnip = "[snip]",
      buffer = "[buf]",
      path = "[path]",
      -- nvim_lua = "[api]",
    })[entry.source.name]

    return vim_item
  end
end

function M.setup()
  local kinds = vim.lsp.protocol.CompletionItemKind
  for i, kind in ipairs(kinds) do
    kinds[i] = M.icons[kind] or kind
  end
end

return M
