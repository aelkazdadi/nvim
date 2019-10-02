let $VIMCONFIG = g:config_dir

if $ZDOTDIR != $VIMCONFIG . '/config/'
  let $ZDOTDIR_OLD = $ZDOTDIR
endif
let $ZDOTDIR = $VIMCONFIG . '/config/'

if empty($SHELL)
  let $SHELL = '/usr/bin/zsh'
  if !filereadable($SHELL)
    let $SHELL = '/usr/bin/bash'
  endif
  if !filereadable($SHELL)
    let $SHELL = ''
  endif
endif

" Keep active window only
if $SHELL == '/usr/bin/zsh'
  let &shell = $SHELL
endif
if $SHELL == '/usr/bin/bash'
  let &shell = $SHELL . ' --rcfile ' . g:config_dir . '/config/termrc'
endif

function! s:TermOpenCall(buf)
  if a:buf == bufnr('%')
    startinsert
    call s:TermEnter()
  endif
  augroup TermGroup
    autocmd TermClose <buffer> call s:TermCloseCall(expand('<abuf>'))
  augroup end
endfunction

function! s:TermCloseCall(buf)
  call CloseBuffer(a:buf, 2)
  filetype detect
  stopinsert
  set scrolloff=5
  set timeout
endfunction

function s:TermEnter()
  nnoremap <buffer> <cr> a
  let g:n_which_key_map_ctrl['<C-Space>'] = 'disable-highlight'
  nnoremap <buffer><silent> <c-space><c-space> :nohlsearch<cr>
  DisableWhitespace
endfunction

augroup TermGroup
  autocmd!
  autocmd TermOpen * call s:TermOpenCall(expand('<abuf>'))
  autocmd WinEnter,BufEnter term://* call s:TermEnter()
  autocmd WinLeave,BufLeave term://* echo | let g:n_which_key_map_ctrl['<C-Space>'] = 'term-current-split'
augroup end
