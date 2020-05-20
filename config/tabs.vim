let g:n_which_key_map_ctrl.n = 'next-tab'
let g:n_which_key_map_ctrl.p = 'prev-tab'
let g:n_which_key_map_ctrl.0 = 'which_key_ignore'
let g:n_which_key_map_ctrl.1 = 'which_key_ignore'
let g:n_which_key_map_ctrl.2 = 'which_key_ignore'
let g:n_which_key_map_ctrl.3 = 'which_key_ignore'
let g:n_which_key_map_ctrl.4 = 'which_key_ignore'
let g:n_which_key_map_ctrl.5 = 'which_key_ignore'
let g:n_which_key_map_ctrl.6 = 'which_key_ignore'
let g:n_which_key_map_ctrl.7 = 'which_key_ignore'
let g:n_which_key_map_ctrl.8 = 'which_key_ignore'
let g:n_which_key_map_ctrl.9 = 'which_key_ignore'

" Next/previous tab
nnoremap <c-space>n gt
nnoremap <c-space>p gT

" Navigate tabs
nnoremap <c-space>1 1gt
nnoremap <c-space>2 2gt
nnoremap <c-space>3 3gt
nnoremap <c-space>4 4gt
nnoremap <c-space>5 5gt
nnoremap <c-space>6 6gt
nnoremap <c-space>7 7gt
nnoremap <c-space>8 8gt
nnoremap <c-space>9 9gt

" Next/previous tab
tnoremap <c-space>n <c-\><c-n>gt
tnoremap <c-space>p <c-\><c-n>gT

" Navigate tabs
tnoremap <c-space>1 <c-\><c-n>1gt
tnoremap <c-space>2 <c-\><c-n>2gt
tnoremap <c-space>3 <c-\><c-n>3gt
tnoremap <c-space>4 <c-\><c-n>4gt
tnoremap <c-space>5 <c-\><c-n>5gt
tnoremap <c-space>6 <c-\><c-n>6gt
tnoremap <c-space>7 <c-\><c-n>7gt
tnoremap <c-space>8 <c-\><c-n>8gt
tnoremap <c-space>9 <c-\><c-n>9gt

function! Tab_move(n)
  try
    execute "tabmove " . a:n
  catch /^Vim\%((\a\+)\)\=:E474/
  endtry
endfunction

if exists('g:neovide')
  nnoremap <c-tab> gt
  inoremap <c-tab> <esc>gt
  tnoremap <c-tab> <c-\><c-n>gt

  nnoremap <c-s-tab> gT
  inoremap <c-s-tab> <esc>gT
  tnoremap <c-s-tab> <c-\><c-n>gT

  nnoremap <c-pagedown> gt
  inoremap <c-pagedown> <esc>gt
  tnoremap <c-pagedown> <c-\><c-n>gt

  nnoremap <c-pageup> gT
  inoremap <c-pageup> <esc>gT
  tnoremap <c-pageup> <c-\><c-n>gT

  nnoremap <silent> <c-s-pagedown> :call Tab_move("+1")<cr>
  inoremap <silent> <c-s-pagedown> <c-o>:call Tab_move("+1")<cr>
  tnoremap <silent> <c-s-pagedown> <c-\><c-n>:call Tab_move("+1")<cr>i

  nnoremap <silent> <c-s-pageup> :call Tab_move("-1")<cr>
  inoremap <silent> <c-s-pageup> <c-o>:call Tab_move("-1")<cr>
  tnoremap <silent> <c-s-pageup> <c-\><c-n>:call Tab_move("-1")<cr>i
endif

nnoremap <silent> <c-space>o :tab split<cr>
tnoremap <silent> <c-space>o <c-\><c-n>:tab split<cr>i
