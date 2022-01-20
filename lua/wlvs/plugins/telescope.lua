return function()
  local telescope = require 'telescope'
  local actions = require 'telescope.actions'
  local themes = require 'telescope.themes'

  telescope.setup {
    defaults = {
    },
    extensions = {
      fzf = {
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
      },
    },
  }

  local builtins = require 'telescope.builtin'

  local function project_files(opts)
    print "Finding Files"
    if not pcall(builtins.git_files, opts) then
      builtins.find_files(opts)
    end
  end

  require('which-key').register {
    ['<C-p>'] = { project_files, 'telescope: find files' },
  }
end

