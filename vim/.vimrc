let mapleader = " "
execute pathogen#infect()

" Pretty Colors
syntax enable
set background=dark
colorscheme solarized

" Font
set guifont=Source\ Code\ Pro:h16

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set undofile
set ruler
set number
set showcmd
set incsearch
set hlsearch
set wildmenu

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
