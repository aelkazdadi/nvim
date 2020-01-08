nnoremap <silent> <leader>ff :Clap files<cr>
nnoremap <silent> <leader>bb :Clap buffers<cr>
nnoremap <silent> <leader>ss :Clap blines<cr>
nnoremap <silent> <leader>sb :Clap lines<cr>

nnoremap <silent> <leader>gc :Clap commits<cr>
nnoremap <silent> <leader>gC :Clap bcommits<cr>

let g:n_which_key_map.f = {}
let g:n_which_key_map.f.name = '+files'
let g:n_which_key_map.f.f = 'file'

let g:n_which_key_map.s.name = '+search'
let g:n_which_key_map.s.t = 'terminals'
let g:n_which_key_map.s.s = 'current-buffer'
let g:n_which_key_map.s.b = 'all-buffers'

if !has_key(g:n_which_key_map, 'g')
  let g:n_which_key_map.g = {}
endif
let g:n_which_key_map.g.name = '+git'
let g:n_which_key_map.g.c = 'commits'
let g:n_which_key_map.g.C = 'commits-current-file'

