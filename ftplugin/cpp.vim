setlocal matchpairs+=<:>
setlocal foldmethod=syntax
setlocal commentstring=//\ %s
let b:ale_linters = [
      \   'clangtidy',
      \]
let b:ale_fixers = [
      \   'clang-format',
      \]

let g:ale_cpp_clangtidy_checks=['-*'
      \]

nnoremap <silent> ,[ :call CocLocationsAsync('ccls','$ccls/inheritance',{'levels':3})<cr>
nnoremap <silent> ,] :call CocLocationsAsync('ccls','$ccls/inheritance',{'derived':v:true,'levels':3})<cr>

if !has_key(g:n_which_key_maplocal, &filetype)
  let g:n_which_key_maplocal['cpp'] = {}
endif

let g:n_which_key_maplocal['cpp']['['] = 'base-hierarchy'
let g:n_which_key_maplocal['cpp'][']'] = 'derived-hierarchy'
