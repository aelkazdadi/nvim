let g:ale_python_black_options='--line-length=80'

" coc mappings
inoremap <silent><expr> <c-space> coc#refresh()

call which_key#register(',', 'g:which_key_maplocal')

if !exists('g:which_key_maplocal')
  let g:which_key_maplocal =  {}
  let g:n_which_key_maplocal =  {}
  let g:v_which_key_maplocal =  {}
endif

function! LocalWhichKeyInit()
  nnoremap <buffer><silent> <localleader> :<c-u>let g:which_key_maplocal={} <bar>
        \ call extend(g:which_key_maplocal, g:n_which_key_maplocal[&filetype]) <bar>
        \ WhichKey ','<cr>
  vnoremap <buffer><silent> <localleader> :<c-u>let g:which_key_maplocal={} <bar>
        \ call extend(g:which_key_maplocal, g:v_which_key_maplocal[&filetype]) <bar>
        \ WhichKeyVisual ','<cr>
endfunction

function! CocMapInit()
  if !has_key(g:n_which_key_maplocal, &filetype)
    let g:n_which_key_maplocal[&filetype] = {}
  endif
  if !has_key(g:v_which_key_maplocal, &filetype)
    let g:v_which_key_maplocal[&filetype] = {}
  endif
  let g:n_which_key_maplocal[&filetype].name = '+' . &filetype

  if CocHasProvider('rename')
    let g:n_which_key_maplocal[&filetype].r = 'rename'
    nnoremap <buffer><silent> <localleader>r :w <bar> call CocActionAsync('rename')<cr>
  endif


  if CocHasProvider('hover')
    let g:n_which_key_maplocal[&filetype].h = 'documentation'
    nnoremap <buffer><silent> <localleader>h :call CocActionAsync('doHover')<cr>
  endif

  if CocHasProvider('foldingRange')
    let g:v_which_key_maplocal[&filetype].f = 'fold'
    vnoremap <buffer><silent> <localleader>f :call CocAction('fold', <f-args>)<cr>
  endif


  if CocHasProvider('definition')
    let g:n_which_key_maplocal[&filetype].d =  {}
    let g:n_which_key_maplocal[&filetype].d.name = '+jump-definition'
    let g:n_which_key_maplocal[&filetype].d.d = 'current-window'
    let g:n_which_key_maplocal[&filetype].d.v = 'vertical-split'
    let g:n_which_key_maplocal[&filetype].d.s = 'horizontal-split'
    let g:n_which_key_maplocal[&filetype].d.t = 'new-tab'
    nnoremap <buffer><silent> <localleader>dd :call CocActionAsync('jumpDefinition')<cr>
    nnoremap <buffer><silent> <localleader>ds :call CocActionAsync('jumpDefinition', 'split')<cr>
    nnoremap <buffer><silent> <localleader>dv :call CocActionAsync('jumpDefinition', 'vsplit')<cr>
    nnoremap <buffer><silent> <localleader>dt :call CocActionAsync('jumpDefinition', 'tabe')<cr>
  endif

  if CocHasProvider('declaration')
    let g:n_which_key_maplocal[&filetype].D =  {}
    let g:n_which_key_maplocal[&filetype].D.name = '+jump-declaration'
    let g:n_which_key_maplocal[&filetype].D.d = 'current-window'
    let g:n_which_key_maplocal[&filetype].D.v = 'vertical-split'
    let g:n_which_key_maplocal[&filetype].D.s = 'horizontal-split'
    let g:n_which_key_maplocal[&filetype].D.t = 'new-tab'
    nnoremap <buffer><silent> <localleader>DD :call CocActionAsync('jumpDeclaration')<cr>
    nnoremap <buffer><silent> <localleader>Ds :call CocActionAsync('jumpDeclaration', 'split')<cr>
    nnoremap <buffer><silent> <localleader>Dv :call CocActionAsync('jumpDeclaration', 'vsplit')<cr>
    nnoremap <buffer><silent> <localleader>Dt :call CocActionAsync('jumpDeclaration', 'tabe')<cr>
  endif

  if CocHasProvider('reference')
    let g:n_which_key_maplocal[&filetype].s = 'find-references'
    nmap <buffer><silent> <localleader>s <plug>(coc-references)
  endif

  if CocHasProvider('typeDefinition')
    let g:n_which_key_maplocal[&filetype].t = 'type-definition'
    nmap <buffer><silent> <localleader>t <plug>(coc-type-definition)
  endif

  if CocHasProvider('implementation')
    let g:n_which_key_maplocal[&filetype].i = 'implementation'
    nmap <buffer><silent> <localleader>i <plug>(coc-implementation)
  endif

  let g:n_which_key_maplocal[&filetype].q = 'format'
  if CocHasProvider('format')
    nmap <silent> <localleader>q <plug>(coc-format)
  elseif exists('b:ale_fixers') && ! empty(b:ale_fixers)
    nmap <localleader>q <plug>(ale_fix)
  else
    let g:n_which_key_maplocal[&filetype].q = 'which_key_ignore'
  endif
  if CocHasProvider('format')
    let g:v_which_key_maplocal[&filetype].q = 'format'
    vmap <silent> <localleader>q <plug>(coc-format-selected)
  endif
  let g:n_which_key_maplocal[&filetype].R = 'refactor'
  nmap <buffer><silent> <localleader>R <plug>(coc-refactor)

  let g:n_which_key_maplocal[&filetype].f = 'fix'
  nmap <buffer><silent> <localleader>f <plug>(coc-fix-current)

  let g:n_which_key_maplocal[&filetype]['<M-r>'] = 'restart-lsp'
  nnoremap <buffer><silent> <localleader><m-r> :CocRestart<cr>

  let g:n_which_key_maplocal[&filetype]['<Space>'] = 'symbols'
  nnoremap <buffer><silent> <localleader><space> :Vista coc<cr>
endfunction

augroup LocalLeaderInit
  autocmd!
  autocmd FileType python,vim,c,cpp,rust,cmake
        \ nmap <buffer><silent> <localleader> \
        \ call LocalWhichKeyInit() <bar>
        \ call CocMapInit() <cr>,|
        \ vmap <buffer><silent> <localleader> \
        \ call LocalWhichKeyInit() <bar>
        \ call CocMapInit() <cr>gv,
augroup end
