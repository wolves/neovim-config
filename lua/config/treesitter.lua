local ts_configs = require('nvim-treesitter.configs')
ts_configs.setup({
  ensure_installed =  {
    "bash",
    "comment",
    "css",
    "go",
    "html",
    "javascript",
    "lua",
    "nix",
    "regex",
    "rust",
    "scss",
    "svelte",
    "toml",
    "tsx",
    "typescript",
    "yaml",
  },
  highlight = { enable = true, use_languagetree = true },
  indent = { enable = true },
  incremental_selection = { enable = true },
  textobjects = { enable = true }
})
