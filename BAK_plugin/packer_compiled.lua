-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = true
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
  ["diffview.nvim"] = {
    commands = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20config.diffview\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/diffview.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20config.gitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    wants = { "plenary.nvim" }
  },
  ["go.nvim"] = {
    config = { "\27LJ\2\n)\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\14config.go\frequire\0" },
    loaded = true,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/start/go.nvim",
    wants = { "nvim-lspconfig" }
  },
  kommentary = {
    after = { "nvim-ts-context-commentstring" },
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20config.comments\frequire\0" },
    keys = { { "", "gc" }, { "", "gcc" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/kommentary",
    wants = { "nvim-ts-context-commentstring" }
  },
  ["lualine-lsp-progress"] = {
    loaded = true,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/start/lualine-lsp-progress"
  },
  ["lualine.nvim"] = {
    config = { "require('config.lualine')" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/lualine.nvim"
  },
  neogit = {
    commands = { "Neogit" },
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18config.neogit\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/neogit"
  },
  neorg = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17config.neorg\frequire\0" },
    loaded = true,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/start/neorg"
  },
  ["neorg-telescope"] = {
    loaded = true,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/start/neorg-telescope"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18config.scroll\frequire\0" },
    keys = { { "", "<C-u>" }, { "", "<C-d>" }, { "", "gg" }, { "", "G" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/neoscroll.nvim"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.bufferline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/nvim-bufferline.lua"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21config.colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15config.lsp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig"
  },
  ["nvim-toggleterm.lua"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20config.terminal\frequire\0" },
    keys = { { "", "<C-t>" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/nvim-toggleterm.lua"
  },
  ["nvim-treesitter"] = {
    after = { "playground", "nvim-treesitter-textobjects" },
    config = { "require('config.treesitter')" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects"
  },
  ["nvim-ts-context-commentstring"] = {
    load_after = {
      kommentary = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  playground = {
    commands = { "TSHighlightCapturesUnderCursor" },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/playground"
  },
  ["plenary.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/popup.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/telescope-fzy-native.nvim"
  },
  ["telescope-project.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/telescope-project.nvim"
  },
  ["telescope-symbols.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/telescope-symbols.nvim"
  },
  ["telescope-z.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/telescope-z.nvim"
  },
  ["telescope.nvim"] = {
    after = { "telescope-z.nvim", "telescope-fzy-native.nvim", "telescope-symbols.nvim", "telescope-project.nvim" },
    commands = { "Telescope" },
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21config.telescope\frequire\0" },
    keys = { { "", "<C-p>" }, { "", "<Leader>p" }, { "", "<Leader>ps" }, { "", "<Leader>pf" }, { "", "<Leader>pb" }, { "", "<Leader>pw" }, { "", "<Leader>vn" }, { "", "<Leader>vh" }, { "", "<Leader>gb" } },
    loaded = false,
    needs_bufread = true,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    wants = { "plenary.nvim", "popup.nvim", "telescope-z.nvim", "telescope-fzy-native.nvim", "telescope-project.nvim", "trouble.nvim", "telescope-symbols.nvim" }
  },
  ["tokyonight.nvim"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17config.theme\frequire\0" },
    loaded = true,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/start/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    commands = { "TroubleToggle", "Trouble" },
    config = { "\27LJ\2\nG\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\14auto_open\1\nsetup\ftrouble\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/trouble.nvim",
    wants = { "nvim-web-devicons" }
  },
  undotree = {
    commands = { "UndotreeToggle" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/undotree"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16config.keys\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/cstingl/.local/share/nvim/site/pack/packer/opt/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^nvim%-web%-devicons"] = "nvim-web-devicons",
  ["^plenary"] = "plenary.nvim",
  ["^popup"] = "popup.nvim",
  ["^telescope"] = "telescope.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: tokyonight.nvim
time([[Config for tokyonight.nvim]], true)
try_loadstring("\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17config.theme\frequire\0", "config", "tokyonight.nvim")
time([[Config for tokyonight.nvim]], false)
-- Config for: go.nvim
time([[Config for go.nvim]], true)
try_loadstring("\27LJ\2\n)\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\14config.go\frequire\0", "config", "go.nvim")
time([[Config for go.nvim]], false)
-- Config for: neorg
time([[Config for neorg]], true)
try_loadstring("\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17config.neorg\frequire\0", "config", "neorg")
time([[Config for neorg]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Trouble lua require("packer.load")({'trouble.nvim'}, { cmd = "Trouble", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Neogit lua require("packer.load")({'neogit'}, { cmd = "Neogit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSHighlightCapturesUnderCursor lua require("packer.load")({'playground'}, { cmd = "TSHighlightCapturesUnderCursor", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DiffviewOpen lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DiffviewClose lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DiffviewToggleFiles lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewToggleFiles", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DiffviewFocusFiles lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewFocusFiles", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TroubleToggle lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <Leader>ps <cmd>lua require("packer.load")({'telescope.nvim'}, { keys = "<lt>Leader>ps", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gcc <cmd>lua require("packer.load")({'kommentary'}, { keys = "gcc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-p> <cmd>lua require("packer.load")({'telescope.nvim'}, { keys = "<lt>C-p>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gg <cmd>lua require("packer.load")({'neoscroll.nvim'}, { keys = "gg", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Leader>vh <cmd>lua require("packer.load")({'telescope.nvim'}, { keys = "<lt>Leader>vh", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-u> <cmd>lua require("packer.load")({'neoscroll.nvim'}, { keys = "<lt>C-u>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Leader>gb <cmd>lua require("packer.load")({'telescope.nvim'}, { keys = "<lt>Leader>gb", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gc <cmd>lua require("packer.load")({'kommentary'}, { keys = "gc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Leader>p <cmd>lua require("packer.load")({'telescope.nvim'}, { keys = "<lt>Leader>p", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-t> <cmd>lua require("packer.load")({'nvim-toggleterm.lua'}, { keys = "<lt>C-t>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Leader>pf <cmd>lua require("packer.load")({'telescope.nvim'}, { keys = "<lt>Leader>pf", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> G <cmd>lua require("packer.load")({'neoscroll.nvim'}, { keys = "G", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Leader>vn <cmd>lua require("packer.load")({'telescope.nvim'}, { keys = "<lt>Leader>vn", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-d> <cmd>lua require("packer.load")({'neoscroll.nvim'}, { keys = "<lt>C-d>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Leader>pb <cmd>lua require("packer.load")({'telescope.nvim'}, { keys = "<lt>Leader>pb", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Leader>pw <cmd>lua require("packer.load")({'telescope.nvim'}, { keys = "<lt>Leader>pw", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'trouble.nvim', 'nvim-bufferline.lua', 'nvim-colorizer.lua', 'nvim-lspconfig', 'gitsigns.nvim'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'which-key.nvim', 'lualine.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'nvim-treesitter'}, { event = "BufRead *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles(0) end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
