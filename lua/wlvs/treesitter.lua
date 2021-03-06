local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

local rainbow_colors

local kana_ok, kana_color = pcall(require, "kanagawa.colors")
if kana_ok then
  rainbow_colors = {
    kana_color.autumnYellow,
    kana_color.oniViolet,
    kana_color.crystalBlue,
    -- kana_color.fujiWhite,
    -- kana_color.sakuraPink,
    -- kana_color.springGreen,
  }
else
  rainbow_colors = {
    "Gold",
    "Orchid",
    "DodgerBlue",
    -- "Cornsilk",
    -- "Salmon",
    -- "LawnGreen",
  }
end

configs.setup({
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  autotag = {
    enable = true,
    disable = { "xml" },
  },
  rainbow = {
    enable = true,
    colors = rainbow_colors,
    disable = { "html" },
  },
  playground = {
    enable = true,
  },
  matchup = {
    enable = true,
  },
})
