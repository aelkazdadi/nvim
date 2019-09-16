" Signify mappings
nmap ]g <plug>(signify-next-hunk)
nmap [g <plug>(signify-prev-hunk)
nmap ]G 9999]g
nmap [G 9999[g

nmap <leader>gr :Gread<cr>
nmap <leader>gg :Gwrite<cr>
nmap <leader>ghh <plug>GitGutterStageHunk
nmap <leader>ghr <plug>GitGutterUndoHunk
nmap <Leader>ghp <Plug>GitGutterPreviewHunk

nmap <leader>g-h :Gdiff HEAD<cr>
nmap <leader>g-- :Gdiff<cr>

nmap <leader>gee :Gedit<cr>
nmap <leader>gev :Gvsplit<cr>
nmap <leader>ges :Gsplit<cr>
nmap <leader>get :Gtabedit<cr>

nmap <leader>gd :Gdelete<cr>
nmap <leader>gm :Gmove ./

nmap <leader>gs :Git<cr>
nmap <leader>g<cr> :Gcommit<cr>

nmap <leader>gpp :Gpush<cr>
nmap <leader>gpl :Gpull<cr>

nmap <leader>sg :Ggrep<cr>

if !has_key(g:n_which_key_map, 'g')
  let g:n_which_key_map.g = {}
endif
let g:n_which_key_map.g.name = '+git'
let g:n_which_key_map.g.r = 'read-staged'
let g:n_which_key_map.g.g = 'stage-file'
let g:n_which_key_map.g.d = 'remove'
let g:n_which_key_map.g.m = 'move'
let g:n_which_key_map.g.s = 'status'
let g:n_which_key_map.g['<CR>'] = 'commit'
let g:n_which_key_map.s.g = 'git-grep'

let g:n_which_key_map.g.h = {}
let g:n_which_key_map.g.h.name = '+hunk'
let g:n_which_key_map.g.h.h = 'stage'
let g:n_which_key_map.g.h.r = 'undo'
let g:n_which_key_map.g.h.p = 'preview'

let g:n_which_key_map.g['-'] = {}
let g:n_which_key_map.g['-'].name = '+diff'
let g:n_which_key_map.g['-'].h = 'head'
let g:n_which_key_map.g['-']['-'] = 'staged'

let g:n_which_key_map.g.e = {}
let g:n_which_key_map.g.e.name = '+edit-git-object'
let g:n_which_key_map.g.e.e = 'current-window'
let g:n_which_key_map.g.e.v = 'vertical-split'
let g:n_which_key_map.g.e.s = 'horizontal-split'
let g:n_which_key_map.g.e.t = 'new-tab'

let g:n_which_key_map.g.p = {}
let g:n_which_key_map.g.p.name = '+remote'
let g:n_which_key_map.g.p.p = 'push'
let g:n_which_key_map.g.p.l = 'pull'
