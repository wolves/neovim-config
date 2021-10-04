local actions = require('telescope.actions')
local telescope = require("telescope")

telescope.setup({
  extensions = { 
    fzy_native = { override_generic_sorter = false, override_file_sorter = true },
  },
  defaults = {
    mappings = {},
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    prompt_prefix = " ",
    selection_caret = " ",
    color_devicons = true,
    winblend = 10,

    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new

  },
})

telescope.load_extension("fzy_native")
telescope.load_extension("z")


local M = {}

M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC >",
        cwd = vim.env.DOTFILES,
        hidden = true,
    })
end

M.search_notes = function()
  print("TODO: Implement Neorg Note/Task File List Integration")
  require("telescope.builtin").find_files({
      prompt_title = "< Notes >",
      cwd = "~/.neorg",
      hidden = true,
  })
end

M.git_branches = function()
  require("telescope.builtin").git_branches({
    attach_mappings = function(_, map)
      map("i", "<c-d>", actions.git_delete_branch)
      map("n", "<c-d>", actions.git_delete_branch)
      return true
    end,
  })
end

local util = require("util")

util.nnoremap("<C-p>", ":lua require'telescope.builtin'.git_files()<CR>")
--util.nnoremap("<leader>pp", ":lua require'telescope'.extensions.project.project{}<CR>")
util.nnoremap("<Leader>pf", ":lua require('telescope.builtin').file_browser()<CR>")
util.nnoremap("<Leader>pb", ":lua require('telescope.builtin').buffers()<CR>")
util.nnoremap("<Leader>pw", ":lua require('telescope.builtin').grep_string { search = vim.fn.expand('<cword>') }<CR>")
util.nnoremap(
  "<Leader>ps",
  ":lua require'telescope.builtin'.grep_string({ search = vim.fn.input( 'Grep for  ')})<CR>"
)

--util.nnoremap("<Leader>vrc", ":lua search_dotfiles()<CR>")
util.nnoremap("<Leader>vn", ":lua require('config.telescope').search_notes()<CR>")
util.nnoremap("<Leader>vh", ":lua require('telescope.builtin').help_tags()<CR>")

util.nnoremap("<Leader>gb", ":lua require('telescope.builtin').git_branches()<CR>")


return M

