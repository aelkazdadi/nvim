setlocal foldmethod=syntax
let b:ale_fixers = [
      \   'cmakeformat',
      \ ]

nmap <buffer><silent> <localleader><cr> \let __tmp__ = line('.')<cr>oeigen<c-s><cr>fmt<c-s><cr><cr>san<c-s><cr><cr><c-u>warn<c-s><cr><esc>\<c-r>=__tmp__<cr><cr>iinit<c-s>

if !has_key(g:n_which_key_maplocal, &filetype)
  let g:n_which_key_maplocal['cmake'] = {}
endif
let g:n_which_key_maplocal['cmake']['<CR>'] = 'generate'
