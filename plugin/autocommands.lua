local fn = vim.fn
local api = vim.api
local contains = vim.tbl_contains

vim.api.nvim_exec(
  [[
   augroup vimrc -- Ensure all autocommands are cleared
   autocmd!
   augroup END
  ]],
  ''
)

local smart_close_filetypes = {
  'help',
  'startuptime',
  'lspinfo',
  'git-status',
  'git-log',
  'gitcommit',
  'LuaTree',
  'log',
  'tsplayground',
  'qf',
}

local function smart_close()
  if fn.winnr '$' ~= 1 then
    api.nvim_win_close(0, true)
  end
end

wlvs.augroup('QuickClose', {
  {
    -- Close certain filetypes by pressing q.
    events = { 'FileType' },
    targets = { '*' },
    command = function()
      local is_readonly = (vim.bo.readonly or not vim.bo.modifiable) and fn.hasmapto('q', 'n') == 0

      local is_eligible = vim.bo.buftype ~= ''
        or is_readonly
        or vim.wo.previewwindow
        or contains(smart_close_filetypes, vim.bo.filetype)

      if is_eligible then
        wlvs.nnoremap('q', smart_close, { buffer = 0, nowait = true })
      end
    end,
  },
})

wlvs.augroup('CheckOutsideTime', {
  {
    -- automatically check for changed files outside vim
    events = { 'WinEnter', 'BufWinEnter', 'BufWinLeave', 'BufRead', 'BufEnter', 'FocusGained' },
    targets = { '*' },
    command = 'silent! checktime',
  },
})

wlvs.augroup('TextYankHighlight', {
  {
    -- don't execute silently in case of errors
    events = { 'TextYankPost' },
    targets = { '*' },
    command = function()
      vim.highlight.on_yank {
        timeout = 300,
        on_visual = false,
        higroup = 'Visual',
      }
    end,
  },
})

local save_excluded = { 'qf', 'gitcommit', 'NeogitCommitMessage' }
local function can_save()
  return wlvs.empty(vim.bo.buftype)
    and not wlvs.empty(vim.bo.filetype)
    and vim.bo.modifiable
    and not vim.tbl_contains(save_excluded, vim.bo.filetype)
end

wlvs.augroup('Utilities', {
{
    -- Remember Cursor locations
    events = { 'BufWinEnter' },
    targets = { '*' },
    command = function()
      local pos = fn.line [['"]]
      if
        vim.bo.ft ~= 'gitcommit'
        and vim.fn.win_gettype() ~= 'popup'
        and pos > 0
        and pos <= fn.line '$'
      then
        vim.cmd 'keepjumps normal g`"'
      end
    end,
  },
{
    events = { 'FileType' },
    targets = { 'gitcommit', 'gitrebase' },
    command = 'set bufhidden=delete',
  },
{
    events = { 'BufWritePre', 'FileWritePre' },
    targets = { '*' },
    command = "silent! call mkdir(expand('<afile>:p:h'), 'p')",
  },
{
    events = { 'BufLeave' },
    targets = { '*' },
    command = function()
      if can_save() then
        vim.cmd 'silent! update'
      end
    end,
  },
})
