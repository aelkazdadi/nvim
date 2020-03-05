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

map ]q <plug>(coc-diagnostic-next)
map [q <plug>(coc-diagnostic-prev)
