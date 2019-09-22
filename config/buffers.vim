function s:SID()
  return matchstr(expand('<sfile>'), '<SNR>\zs\d\+\ze_SID$')
endfunction

function <SID>prefix()
  return '<SNR>' . s:SID() . '_'
endfunction

function s:HideBufferWindow(bufnr)
  if bufnr('') == a:bufnr
    next __Scratch__
  endif
endfunction

function s:HideBufferTabs(bufnr)
  windo call s:HideBufferWindow(a:bufnr)
endfunction

function CloseBuffer(bufnr, force)
  if a:bufnr == 0
    let bufnr = bufnr('')
  else
    let bufnr = a:bufnr
  endif
  if bufname(bufnr) == '__Scratch__'
    return
  endif
  let win_id = win_getid()

  tabdo call s:HideBufferTabs(bufnr)

  try
    if a:force == 2
      execute 'bwipeout! ' . bufnr
    elseif a:force == 1
      execute 'bdelete! ' . bufnr
    else
      execute 'bdelete ' . bufnr
    endif
  catch | endtry
  call win_gotoid(win_id)
endfunction

" ScrollOff
function s:ScrollOffCall()
  if &buftype ==# 'terminal'
    set scrolloff=0
  elseif &buftype ==# 'help'
    set scrolloff=999
  else
    set scrolloff=5
  endif
endfunction

augroup ScrollOff
  autocmd!
  autocmd WinEnter,BufEnter * call s:ScrollOffCall()
  autocmd TermOpen * set scrolloff=0
augroup end

function s:bufdelete_noforce(lines)
  for line in a:lines
    let nr = str2nr(matchstr(line, '\[\zs[0-9]*\ze\]'))
    if nr | call CloseBuffer(nr, 0) | endif
  endfor
endfunction

nnoremap <silent> <leader>bd
      \ :call fzf#vim#buffers('', {
      \ 'sink*':function(<SID>prefix() . 'bufdelete_noforce'),
      \ 'options':['-m', '--cycle', '--header-lines=0',
      \ '--bind=ctrl-a:select-all,ctrl-d:deselect-all',
      \]}, 0)<cr>

let g:n_which_key_map.b = {}
let g:n_which_key_map.b.name = '+buffers'
let g:n_which_key_map.b.b = 'list'
let g:n_which_key_map.b.d = 'delete'
