" Fuzzy find files in the working directory

if empty($FZF_DEFAULT_COMMAND)
  let $FZF_DEFAULT_COMMAND = 'fd'
endif

let g:n_which_key_map.s = {}
" Fuzzy find text in the working directory
nnoremap <silent> <leader>sr :Rg<cr>

" Ctrl actions
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }

" Insert mode completion
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

augroup FzfMappings
  autocmd!
  autocmd FileType fzf
        \ tnoremap <buffer> <c-h> <c-h>|
        \ tnoremap <buffer> <c-j> <c-j>|
        \ tnoremap <buffer> <c-k> <c-k>|
        \ tnoremap <buffer> <c-l> <c-l>|
        \ autocmd! TermGroup TermClose <buffer>
augroup end
