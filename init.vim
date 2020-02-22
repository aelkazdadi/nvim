" Python path
let g:python3_host_prog = $HOME . '/.local/share/nvim/venv/bin/python3'
set pyxversion=3

set termguicolors

filetype plugin indent on
syntax on
set undofile

" Don't use Ex mode, use Q for formatting
map Q gq

let &guicursor='a:block-blinkon0'
let &guifont='Inconsolata Nerd Font Regular:h10'
set mouse=n               " Disable mouse support
set expandtab             " Expand TABs to spaces

set tabstop=4             " The width of a TAB is set to 4.

set shiftwidth=2          " Indents will have a width of 4

set softtabstop=2         " Sets the number of columns for a TAB

set number                " Show line numbers
set relativenumber        " Show line numbers
set lazyredraw            " Don't redraw the screen during commands/macros
set expandtab             " Expand TABs to spaces
set scrolloff=5           " Scrolloff
set formatoptions-=t      " Disable hard line wrapping
set hidden                " Buffers don't need to attach to a window
set gdefault              " Global substitution by default
set inccommand=split      " Live substitution
set foldlevel=99          " Unfold by default
set ignorecase smartcase  " Smartcase in search/substitution
set cmdheight=2           " 2 line command line
set updatetime=100
set timeout timeoutlen=500

" Unmap CTRL-] and backspace
noremap <bs> <nop>
noremap <c-]> <nop>

" Leader key
let mapleader=" "
let maplocalleader=","
noremap <leader> <nop>
noremap <localleader> <nop>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Plugins                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:config_dir = expand('<sfile>:p:h')
function! s:Source(fname)
  execute 'source ' . g:config_dir . '/' . a:fname
endfunction

" Vim Plug
set rtp+=$LOCAL_HOME/.local/share/nvim
call plug#begin('~/.local/share/nvim/plugged')
" Themes
Plug 'vim-airline/vim-airline-themes'
Plug 'gruvbox-community/gruvbox'
Plug 'cormacrelf/vim-colors-github'
Plug 'NLKNguyen/papercolor-theme'
Plug 'mkarmona/materialbox'
Plug 'joshdick/onedark.vim'
Plug 'lifepillar/vim-gruvbox8'
Plug 'lifepillar/vim-solarized8'
" Plugins
Plug 'neoclide/coc.nvim', { 'branch' : 'master' }
Plug 'w0rp/ale'
Plug 'tpope/vim-commentary'
Plug 'ervandew/supertab'
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
Plug 'ntpeters/vim-better-whitespace'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'lervag/vimtex'
Plug 'simeji/winresizer'
Plug 'junegunn/fzf', { 'dir': '~/.local/share/fzf', 'do': './install --all --no-update-rc' }
Plug 'junegunn/fzf.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'tmsvg/pear-tree'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-vinegar'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'pboettch/vim-cmake-syntax'
Plug 'vim-python/python-syntax'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'liuchengxu/vim-which-key'
Plug 'unblevable/quick-scope'
Plug 'aelkazdadi/rainbow', { 'branch' : 'inline-endif-bugfix' }
Plug 'terryma/vim-expand-region'
Plug 'vim-scripts/matchit.zip'
Plug 'pbrisbin/vim-mkdir'
Plug 'dbakker/vim-projectroot'
Plug 'blueyed/vim-diminactive'
Plug 'kshenoy/vim-signature'
Plug 'mbbill/undotree'
Plug 'wellle/targets.vim'
Plug 'liuchengxu/vista.vim'
call plug#end()

"Gruvbox
let g:gruvbox_italic = 1
let g:gruvbox_contrast_light = "soft"
let g:gruvbox_contrast_dark = "medium"
let g:gruvbox_improved_strings = 1
let g:gruvbox_improved_warnings = 1

let g:rainbow_active = 1
augroup Rainbow
  autocmd!
  autocmd FileType cmake RainbowToggleOff
augroup end

let g:better_whitespace_operator = ''
let g:better_whitespace_filetypes_blacklist =
      \['diff', 'gitcommit', 'unite', 'qf', 'help', 'markdown', 'fugitive', '']

" Window resizer
let g:winresizer_start_key='<c-space>.'

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=0

" Python syntax
let g:python_highlight_all = 1

" Tab completion direction
let g:SuperTabDefaultCompletionType = '<c-n>'

" Highlight yanked text
let g:highlightedyank_highlight_duration = 300

" Highlight yanked text
let g:highlightedyank_highlight_duration = 300

" Quick Scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Targets
let g:targets_seekRanges = 'cc cr cb cB lc ac Ac lr lb ar ab lB Ar aB Ab AB rr ll rb al rB Al bb aa bB Aa BB AA'

" Ale
let g:airline#extensions#ale#enabled = 1
let g:ale_virtualtext_cursor=1
let g:ale_sign_column_always = 1
map ]q <plug>(coc-diagnostic-next)
map [q <plug>(coc-diagnostic-prev)

" Vim visual star search
function! SearchSelection()
  let temp = @"
  normal! gvy
  let @/ = substitute(@", '\\', '\\\\', 'g')
  let @/ = substitute(@/, '\/', '\\\/', 'g')
  let @/ = substitute(@/, '\n', '\\n', 'g')
  let @/ = '\V' . @/
  let @" = temp
endfunction
xnoremap <silent> * <esc>:call SearchSelection()<cr>/<c-r>/<cr>
xnoremap <silent> # <esc>:call SearchSelection()<cr>?<c-r>/<cr>

call s:Source('config/which_key.vim')
call s:Source('config/snippets.vim')
call s:Source('config/vimtex.vim')
call s:Source('config/fzf.vim')
call s:Source('config/git.vim')
call s:Source('config/easymotion.vim')
call s:Source('config/peartree.vim')
call s:Source('config/local.vim')
call s:Source('config/buffers.vim')
call s:Source('config/tabs.vim')
call s:Source('config/terminal.vim')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Other User Config                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:light_theme = "onedark"
let g:dark_theme ="onedark"

set background=dark
execute "colorscheme " . g:dark_theme

function ChangeTheme()
  if &background == "light"
    set background=dark
    execute "colorscheme " . g:dark_theme
  else
    set background=light
    execute "colorscheme " . g:light_theme
  endif
endfunction

map <expr> <F2> ChangeTheme()

" Disable search highlighting
nnoremap <silent> <M-.> :nohlsearch <bar> echo<cr>
vnoremap <silent> <M-.> :<c-u>nohlsearch <bar> echo<cr>gv
inoremap <silent> <M-.> <c-o>:nohlsearch <bar> echo<cr>
tnoremap <silent> <M-.> <c-\><c-n>:nohlsearch <bar> echo<cr>i

nnoremap <leader><tab> <c-^>
let g:n_which_key_map['<Tab>'] = 'alternate-buffer'
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

cnoremap <c-p> <up>
cnoremap <c-n> <down>

noremap : ,
noremap \ :

" Window movement
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Vertical split on the right, horizontal on the bottom
set splitright
set splitbelow

" Copy/Paste
nnoremap <leader>y "+y
vnoremap <leader>y "+y

vnoremap P pgvy`>
nnoremap <m-p> "+p
vnoremap <m-p> "+p
nnoremap <m-P> "+P
nnoremap ]p o<esc>0Dp
nnoremap [p O<esc>0Dp
nnoremap ]P o<esc>0D"+p
nnoremap [P O<esc>0D"+p

let g:n_which_key_map.y = 'copy-clipboard'
let g:v_which_key_map.y = 'copy-clipboard'

" Moving in insert mode
inoremap <c-h> <left>
inoremap <c-l> <right>

" Switch HL / ^$
noremap H ^
noremap L $
noremap ^ H
noremap $ L

" Move selection
vnoremap <silent> J :<c-u>execute "'<,'>m '>+" . v:count1 <cr> gv=gv
vnoremap <silent> K :<c-u>execute "'<,'>m '<-" . (1+v:count1) <cr> gv=gv

" Highlight matches in search->cedit
augroup CmdWinHighlight
  autocmd!
  autocmd CmdwinEnter /,? let @/ = getline('.') |
        \ autocmd TextChanged,TextChangedI,TextChangedP
        \ <buffer> let @/ = getline('.')
augroup end

" Help in vertical split
cnoreabbrev h tab help
cnoreabbrev hh help

cnoreabbre \( \(\)<left><left>

" Windows
let g:n_which_key_map_ctrl['.'] = 'window-resizer'
let g:n_which_key_map_ctrl.d = 'close-window'
let g:n_which_key_map_ctrl.d = 'close-buffer+window'
let g:n_which_key_map_ctrl['='] = 'balance-splits'
let g:n_which_key_map_ctrl['<C-Space>'] = 'term-current-split'
let g:n_which_key_map_ctrl.s = 'term-split-horizontal'
let g:n_which_key_map_ctrl.v = 'term-split-vertical'
let g:n_which_key_map_ctrl.t = 'term-new-tab'
let g:n_which_key_map_ctrl.o = 'maximize-window'

nnoremap <silent> <c-space>d :close<cr>
nnoremap <silent> <c-space>D :tabclose<cr>
nnoremap <silent> <c-space>q :bdelete<cr>
nnoremap <silent> <c-space>Q :bdelete!<cr>
nnoremap <silent> <c-space>= <c-w>=
nnoremap <silent> <c-space><c-space> :terminal<cr>

nnoremap <silent> <c-space>v :vsplit <bar> terminal<cr>
nnoremap <silent> <c-space>s :split  <bar> terminal<cr>
nnoremap <silent> <c-space>t :tabnew <bar> terminal<cr>
tnoremap <silent> <c-space>v <c-\><c-n>:vsplit <bar> terminal<cr>
tnoremap <silent> <c-space>s <c-\><c-n>:split  <bar> terminal<cr>
tnoremap <silent> <c-space>t <c-\><c-n>:tabnew <bar> terminal<cr>

tnoremap <silent> <c-h> <c-\><c-n><c-w>h
tnoremap <silent> <c-j> <c-\><c-n><c-w>j
tnoremap <silent> <c-k> <c-\><c-n><c-w>k
tnoremap <silent> <c-l> <c-\><c-n><c-w>l
tnoremap <c-\> <c-\>

tnoremap <silent> <c-space><space> <c-space>
tnoremap <silent> <c-space><c-space> <c-\><c-n>
tnoremap <silent> <m-cr> <c-\><c-n>
tnoremap <silent> <c-space><m-cr> <m-cr>
tnoremap <silent> <c-space>h <c-h>
tnoremap <silent> <c-space>j <c-j>
tnoremap <silent> <c-space>k <c-k>
tnoremap <silent> <c-space>l <c-l>

nnoremap <silent> <c-space>o :tab split<cr>
tnoremap <silent> <c-space>o <c-\><c-n>:tab split<cr>i

" Vim
let g:n_which_key_map.q = {}
let g:n_which_key_map.q.name = '+vim'

nnoremap <silent> <leader>qq
      \ :echon 'Quit? (y/n): ' <bar>
      \ if tolower(nr2char(getchar())) == 'y' <bar>
      \ qa <bar> else <bar> echo '' <bar> endif<cr>
nnoremap <silent> <leader>qe :execute 'lcd ' . g:config_dir . '<bar> edit init.vim'<cr>
nnoremap <silent> <leader>qf :execute 'Files ' . g:config_dir<cr>
let g:n_which_key_map.q.q = 'quit'
let g:n_which_key_map.q.e = 'init-file'
let g:n_which_key_map.q.f = 'config-files'
