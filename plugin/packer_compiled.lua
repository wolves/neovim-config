-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/cstingl/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/cstingl/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/cstingl/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/cstingl/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/cstingl/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/start/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/start/cmp_luasnip"
  },
  ["diffview.nvim"] = {
    commands = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18wlvs.diffview\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/diffview.nvim"
  },
  ["gitlinker.nvim"] = {
    loaded = true,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/start/gitlinker.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18wlvs.gitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim"
  },
  ["go.nvim"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16wlvs.golang\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/go.nvim",
    wants = { "nvim-lspconfig" }
  },
  kommentary = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\20wlvs.kommentary\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/kommentary"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lsp-trouble.nvim"] = {
    commands = { "LspTrouble" },
    config = { "\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\17auto_preview\1\14auto_fold\2\nsetup\ftrouble\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/lsp-trouble.nvim"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/start/lsp_extensions.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17wlvs.lualine\frequire\0" },
    loaded = true,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim"
  },
  neogit = {
    commands = { "Neogit" },
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16wlvs.neogit\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/neogit"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16wlvs.scroll\frequire\0" },
    loaded = true,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/start/neoscroll.nvim"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20wlvs.bufferline\frequire\0" },
    loaded = true,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19wlvs.colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-toggleterm.lua"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18wlvs.terminal\frequire\0" },
    keys = { { "", "<C-t>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-treesitter-textobjects", "nvim-treesitter-refactor" },
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\20wlvs.treesitter\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["octo.nvim"] = {
    loaded = true,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/start/octo.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["splitjoin.vim"] = {
    keys = { { "", "gJ" }, { "", "gS" } },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/splitjoin.vim"
  },
  tabular = {
    loaded = true,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/start/tabular"
  },
  ["telescope-fzy-native.nvim"] = {
    config = { "\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\15fzy_native\19load_extension\14telescope\frequire\0" },
    loaded = true,
    needs_bufread = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/telescope-fzy-native.nvim"
  },
  ["telescope-github.nvim"] = {
    config = { "\27LJ\2\nG\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\agh\19load_extension\14telescope\frequire\0" },
    loaded = true,
    needs_bufread = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/telescope-github.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15wlvs.theme\frequire\0" },
    loaded = true,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/start/tokyonight.nvim"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/undotree"
  },
  ["vim-prettier"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier"
  },
  ["vim-qf"] = {
    loaded = true,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/start/vim-qf"
  },
  ["vim-startify"] = {
    commands = { "SLoad", "SSave" },
    config = { "\27LJ\2\n>\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\2\0=\1\2\0K\0\1\0!startify_disable_at_vimenter\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n)\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\14wlvs.keys\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: tokyonight.nvim
time([[Config for tokyonight.nvim]], true)
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15wlvs.theme\frequire\0", "config", "tokyonight.nvim")
time([[Config for tokyonight.nvim]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16wlvs.scroll\frequire\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17wlvs.lualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20wlvs.bufferline\frequire\0", "config", "nvim-bufferline.lua")
time([[Config for nvim-bufferline.lua]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LspTrouble lua require("packer.load")({'lsp-trouble.nvim'}, { cmd = "LspTrouble", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Neogit lua require("packer.load")({'neogit'}, { cmd = "Neogit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DiffviewToggleFiles lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewToggleFiles", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DiffviewClose lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'markdown-preview.nvim'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DiffviewOpen lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SLoad lua require("packer.load")({'vim-startify'}, { cmd = "SLoad", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SSave lua require("packer.load")({'vim-startify'}, { cmd = "SSave", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DiffviewFocusFiles lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewFocusFiles", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> gS <cmd>lua require("packer.load")({'splitjoin.vim'}, { keys = "gS", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gJ <cmd>lua require("packer.load")({'splitjoin.vim'}, { keys = "gJ", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-t> <cmd>lua require("packer.load")({'nvim-toggleterm.lua'}, { keys = "<lt>C-t>", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType go ++once lua require("packer.load")({'go.nvim'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'vim-prettier'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'vim-prettier'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'vim-prettier'}, { ft = "javascript" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'which-key.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'gitsigns.nvim', 'nvim-colorizer.lua'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'kommentary', 'nvim-treesitter'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au BufNewFile * ++once lua require("packer.load")({'kommentary', 'nvim-treesitter'}, { event = "BufNewFile *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/css.vim]], true)
vim.cmd [[source /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/css.vim]]
time([[Sourcing ftdetect script at: /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/css.vim]], false)
time([[Sourcing ftdetect script at: /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/graphql.vim]], true)
vim.cmd [[source /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/graphql.vim]]
time([[Sourcing ftdetect script at: /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/graphql.vim]], false)
time([[Sourcing ftdetect script at: /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/html.vim]], true)
vim.cmd [[source /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/html.vim]]
time([[Sourcing ftdetect script at: /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/html.vim]], false)
time([[Sourcing ftdetect script at: /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/javascript.vim]], true)
vim.cmd [[source /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/javascript.vim]]
time([[Sourcing ftdetect script at: /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/javascript.vim]], false)
time([[Sourcing ftdetect script at: /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/json.vim]], true)
vim.cmd [[source /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/json.vim]]
time([[Sourcing ftdetect script at: /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/json.vim]], false)
time([[Sourcing ftdetect script at: /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/less.vim]], true)
vim.cmd [[source /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/less.vim]]
time([[Sourcing ftdetect script at: /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/less.vim]], false)
time([[Sourcing ftdetect script at: /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/lua.vim]], true)
vim.cmd [[source /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/lua.vim]]
time([[Sourcing ftdetect script at: /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/lua.vim]], false)
time([[Sourcing ftdetect script at: /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/markdown.vim]], true)
vim.cmd [[source /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/markdown.vim]]
time([[Sourcing ftdetect script at: /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/markdown.vim]], false)
time([[Sourcing ftdetect script at: /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/php.vim]], true)
vim.cmd [[source /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/php.vim]]
time([[Sourcing ftdetect script at: /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/php.vim]], false)
time([[Sourcing ftdetect script at: /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/ruby.vim]], true)
vim.cmd [[source /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/ruby.vim]]
time([[Sourcing ftdetect script at: /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/ruby.vim]], false)
time([[Sourcing ftdetect script at: /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/scss.vim]], true)
vim.cmd [[source /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/scss.vim]]
time([[Sourcing ftdetect script at: /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/scss.vim]], false)
time([[Sourcing ftdetect script at: /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/svelte.vim]], true)
vim.cmd [[source /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/svelte.vim]]
time([[Sourcing ftdetect script at: /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/svelte.vim]], false)
time([[Sourcing ftdetect script at: /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/typescript.vim]], true)
vim.cmd [[source /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/typescript.vim]]
time([[Sourcing ftdetect script at: /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/typescript.vim]], false)
time([[Sourcing ftdetect script at: /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/vue.vim]], true)
vim.cmd [[source /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/vue.vim]]
time([[Sourcing ftdetect script at: /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/vue.vim]], false)
time([[Sourcing ftdetect script at: /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/xml.vim]], true)
vim.cmd [[source /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/xml.vim]]
time([[Sourcing ftdetect script at: /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/xml.vim]], false)
time([[Sourcing ftdetect script at: /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/yaml.vim]], true)
vim.cmd [[source /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/yaml.vim]]
time([[Sourcing ftdetect script at: /Users/cstingl/.local/share/nvim/site/pack/packer/opt/vim-prettier/ftdetect/yaml.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
