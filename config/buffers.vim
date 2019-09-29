function s:SID()
  return matchstr(expand('<sfile>'), '<SNR>\zs\d\+\ze_SID$')
endfunction

function <SID>prefix()
  return '<SNR>' . s:SID() . '_'
endfunction

function s:HideBufferWindow(bufnr)
  if bufnr('') == a:bufnr
    edit /tmp/_Scratch
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
  if bufname(bufnr) == '/tmp/_Scratch'
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

" Buffer specific settings
function s:ScrollOffCall()
  if &buftype ==# 'terminal'
    set scrolloff=0
    set notimeout
  elseif &buftype ==# 'help'
    set scrolloff=999
    set timeout
  else
    set scrolloff=5
    set timeout
  endif
endfunction

augroup ScrollOff
  autocmd!
  autocmd WinEnter,BufEnter * call s:ScrollOffCall()
  autocmd TermOpen * call s:ScrollOffCall()
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

" Scratch buffer
augroup ScratchBuf
  autocmd VimEnter * if bufname('%') == '' | edit /tmp/_Scratch | else | badd /tmp/_Scratch | endif
        \ | call setbufvar('/tmp/_Scratch', '&buftype', 'nofile')
        \ | call setbufvar('/tmp/_Scratch', '&bufhidden', 'hide')
        \ | call setbufvar('/tmp/_Scratch', '&swapfile', 0)
augroup end
