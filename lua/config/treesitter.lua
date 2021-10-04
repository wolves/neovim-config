local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg",
    files = { "src/parser.c", "src/scanner.cc" },
      workspaces = {
        ["dots"]    = "~/.dotfiles_new",
        ["nvim"]    = "~/.config/nvim",
        ["kitty"]    = "~/.config/kitty",
        ["data"]    = "~/.local/share",
        ["project"] = "~/code",
        ["piq"]     = "~/code/ruby/piq",
        ["sbui"]    = "~/code/sunbird/seven_ui",
        ["go"]      = "~/code/go/github.com/wolves"
      },
    branch = "main"
  },
}

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
    "norg",
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
