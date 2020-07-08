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

nmap <silent> ]q <plug>(coc-diagnostic-next)
nmap <silent> [q <plug>(coc-diagnostic-prev)
nmap <silent> ]e <plug>(coc-diagnostic-next-error)
nmap <silent> [e <plug>(coc-diagnostic-prev-error)

lcd .

function! Compile_asm(line)
  if a:line !~ "^//.*"
    return
  endif
  let compiler = split(a:line)[1]
  let compiler_list = ["gcc", "clang", "cc", "g++", "clang++", "c++"]
  if index(compiler_list, compiler) == -1
    return
  endif
  let file_path = expand("%:p")
  let obj_path = "/tmp/" . expand("%:t:r") . "." . compiler . ".o"
  let asm_path = "/tmp/" . expand("%:t:r") . "." . compiler . ".s"
  let compile_cmd = a:line[3:] . " " . file_path . " -c -o " . obj_path
  let objdump_cmd = 'source "$ZDOTDIR_OLD/.zshrc" '
        \ . '&& disassemble ' . obj_path
        \ . "| sed '/^ *[0-f]*:\t00/d' > " . asm_path
  let delete_cmd = "rm " . obj_path
  echom compile_cmd
  echom objdump_cmd
  echom system(compile_cmd . " && " . objdump_cmd . " &&" . delete_cmd)
  return asm_path
endfunction

nnoremap <buffer><silent> [] :call Compile_asm(getline(1)) <bar>
      \ call Compile_asm(getline(2)) <bar>
      \ checktime<cr>
