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
set background=dark
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
call plug#begin('~/.local/share/nvim/plugged')
" Themes
Plug 'gruvbox-community/gruvbox'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline-themes'
" Plugins
Plug 'neoclide/coc.nvim', { 'branch' : 'release' }
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
Plug 'SirVer/ultisnips'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
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
Plug 'luochen1990/rainbow'
Plug 'terryma/vim-expand-region'
Plug 'vim-scripts/matchit.zip'
Plug 'pbrisbin/vim-mkdir'
Plug 'nelstrom/vim-visual-star-search'
Plug 'dbakker/vim-projectroot'
Plug 'enricobacis/vim-airline-clock'
call plug#end()

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
let g:airline_powerline_fonts=1

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

" Ale
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
map ]q <plug>(ale_next)
map [q <plug>(ale_previous)

" Vim visual star search
nnoremap <leader>* <nop>
vnoremap <leader>* <nop>

call s:Source('config/which_key.vim')
call s:Source('config/ultisnips.vim')
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
colorscheme gruvbox

nnoremap <leader><tab> <c-^>
let g:n_which_key_map['<Tab>'] = 'alternate-buffer'

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
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
nnoremap ]p o<c-u><esc>p
nnoremap [p O<c-u><esc>p
nnoremap ]P o<esc>0D"+p
nnoremap [P O<esc>0D"+p

let g:n_which_key_map.y = 'copy-clipboard'
let g:n_which_key_map.p = 'paste-clipboard-after'
let g:n_which_key_map.P = 'paste-clipboard-before'
let g:v_which_key_map.y = 'copy-clipboard'
let g:v_which_key_map.p = 'paste-clipboard-after'
let g:v_which_key_map.P = 'paste-clipboard-before'

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

" Windows
nnoremap <silent> <c-space>d :close<cr>
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

tnoremap <silent> <c-space><space> <c-space>
tnoremap <silent> <c-space><c-space> <c-\><c-n>
tnoremap <silent> <c-space>h <c-h>
tnoremap <silent> <c-space>j <c-j>
tnoremap <silent> <c-space>k <c-k>
tnoremap <silent> <c-space>l <c-l>

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
