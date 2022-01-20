local status_ok, zen_mode = pcall(require, "zen-mode")
if not status_ok then
  return
end

zen_mode.setup({
  window = {
    backdrop = 0.8,
    height = 1, -- height of the Zen window
    width = 100,
    options = {
      signcolumn = "no", -- disable signcolumn
      number = false, -- disable number column
      relativenumber = false, -- disable relative numbers
      -- cursorline = false, -- disable cursorline
      -- cursorcolumn = false, -- disable cursor column
      -- foldcolumn = "0", -- disable fold column
      -- list = false, -- disable whitespace characters
    },
  },
  plugins = {
    gitsigns = { enabled = false }, -- disables git signs
    tmux = { enabled = false },
    twilight = { enabled = true },
  },
  -- callback where you can add custom code when the Zen window opens
  on_open = function()
    vim.cmd("PencilSoft")
  end,
  -- callback where you can add custom code when the Zen window closes
  on_close = function()
    vim.cmd("PencilOff")
  end,
  -- on_open = function()
  --   vim.lsp.diagnostic.disable()
  --   vim.cmd [[
  --       set foldlevel=10
  --       IndentBlanklineDisable
  -- vim.cmd('PencilSoft')
  --       ]]
  -- end,
  -- on_close = function()
  --   vim.lsp.diagnostic.enable()
  --   vim.cmd [[
  --       set foldlevel=5
  --       IndentBlanklineEnable
  -- vim.cmd('PencilOff')
  --       ]]
  -- end,
})
