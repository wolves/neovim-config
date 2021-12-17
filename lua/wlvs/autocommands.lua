vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FocusGained * :checktime
    autocmd FileType help,startuptime,qf,lspinfo nnoremap <buffer><silent> q :close<CR>
    autocmd FileType man nnoremap <buffer><silent> q :quit<CR>
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Search', timeout = 200})
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _go
    autocmd!
    autocmd FileType GoTest nnoremap <buffer><silent> q :bd<CR>
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end
]]
