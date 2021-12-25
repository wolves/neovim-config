local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  return
end

local util = require("util")

local M = {}

function M.setup(client, bufnr)
  -- Mappings
  local opts = { noremap = true, silent = true, buffer = bufnr }

  local keymap = {
    l = {
      name = "lsp",
      f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
    },
  }

  local keymap_visual = {
    l = {
      name = "lsp",
      a = { ":<C-U>lua vim.lsp.buf.range_code_action()<CR>", "Code Action" },
    },
  }

  local keymap_goto = {
    name = "goto",
    D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
    -- d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
    i = { "<cmd>lua vim.lsp.buf.implementation<CR>", "Implementation" },
    r = { "<cmd>Telescope lsp_references<CR>", "Telescope References" },
    -- s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
    -- t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type Definition" },
  }

  util.nnoremap("K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  util.nnoremap("[e", "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", opts)
  util.nnoremap("]e", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", opts)

  -- local trigger_chars = client.resolved_capabilities.signature_help_trigger_characters
  -- trigger_chars = { "," }
  -- for _, c in ipairs(trigger_chars) do
  --   util.inoremap(c, function()
  --     vim.defer_fn(function()
  --       pcall(vim.lsp.buf.signature_help)
  --     end, 0)
  --     return c
  --   end, {
  --       noremap = true,
  --       silent = true,
  --       buffer = bufnr,
  --       expr = true,
  --     })
  -- end

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    keymap.l.f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format Document" }
  elseif client.resolved_capabilities.document_range_formatting then
    keymap_visual.l.f = { "<cmd>lua vim.lsp.buf.range_formatting()<CR>", "Format Range" }
  end

  wk.register(keymap, { buffer = bufnr, prefix = "<leader>" })
  wk.register(keymap_visual, { buffer = bufnr, prefix = "<leader>", mode = "v" })
  wk.register(keymap_goto, { buffer = bufnr, prefix = "g" })
end

return M
