set nocompatible
let mapleader = " "
execute pathogen#infect()

" Pretty Colors
syntax enable
set background=dark
colorscheme solarized
let g:airline_theme='solarized'
set termguicolors

" Font
set guifont=Source\ Code\ Pro:h16

set undofile
set ruler
set number
set showcmd
set incsearch
set hlsearch
set wildmenu
set diffopt+=vertical

filetype plugin indent on

" EasyMotion
" Disable default mappings
let g:EasyMotion_do_mapping = 0
" `s{char}{char}{label}`
nmap s <Plug>(easymotion-overwin-f2)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" jk motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
let g:EasyMotion_keys = 'uhetonas'

" CtrlP
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  'node_modules\|target\|\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|beam|class)$',
  \ }

" Airline
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = '|'
let g:airline_right_alt_sep = '|'
let g:airline#entensions#branch#empty_message = 'No VC'

" some toggles I like
map <Leader>tn :set number!<Return>
map <Leader>sc :noh<Return>
" File based operations
map <Leader>ff :CtrlP<Return>
map <Leader>fed :edit ~/.vimrc<Return>
map <Leader>fs :w<Return>
" Quitting, etc
map <Leader>qq :q<Return>
map <Leader>qx :x<Return>
map <Leader>qr :source ~/programming/dotfiles/vim/.vimrc<Return>
map <Leader>w2 :vsplit<Return><C-W><C-W>
map <Leader>wd :hide<Return>
map <Leader>ww <C-W><C-W>
" Move to other windows
map <Leader>wh <C-W>h
map <Leader>wl <C-W>l
map <Leader>wj <C-W>j
map <Leader>wk <C-W>k
" Move other windows to far left, right, etc
map <Leader>wH <C-W>H
map <Leader>wL <C-W>L
map <Leader>wJ <C-W>J
map <Leader>wK <C-W>K
" Git related Things
map <Leader>gs :Gstatus\|only<Return>
map <Leader>gD <Leader>wd<Leader>wd

nnoremap K <ESC>i<Return><ESC>

