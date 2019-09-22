let $VIMCONFIG = g:config_dir
if $ZDOTDIR_OLD != $ZDOTDIR
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
nnoremap <silent> <c-space>o :call MaximizeWindow()<cr>
tnoremap <silent> <c-space>o :call MaximizeWindow()<cr>

if $SHELL == '/usr/bin/zsh'
  let &shell = $SHELL
endif
if $SHELL == '/usr/bin/bash'
  let &shell = $SHELL . ' --rcfile ' . g:config_dir . '/config/termrc'
endif

function! s:TermOpenCall(buf)
  if a:buf == bufnr('%')
    startinsert
    DisableWhitespace
  endif
  augroup TermGroup
    autocmd TermClose <buffer> call s:TermCloseCall(expand('<abuf>'))
  augroup end
endfunction

function! s:TermCloseCall(buf)
  call CloseBuffer(a:buf, 2)
  filetype detect
  stopinsert
endfunction

augroup TermGroup
  autocmd!
  autocmd TermOpen * call s:TermOpenCall(expand('<abuf>'))
  autocmd WinEnter,BufEnter term://* startinsert | DisableWhitespace
augroup end
