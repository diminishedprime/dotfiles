let mapleader = " "
execute pathogen#infect()

" Pretty Colors
syntax enable
set background=dark
colorscheme solarized
set termguicolors

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

" CtrlP
map <Leader>ff :CtrlP 
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  'node_modules\|target\|\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|beam|class)$',
  \ }

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'

" some toggles I like
map <Leader>tn :set number!<Return>
map <Leader>sc :noh<Return>
map <Leader>fed :edit ~/.vimrc<Return>
map <Leader>fs :w<Return>
map <Leader>w2 :vsplit<Return><C-W><C-W>
map <Leader>wd :hide<Return>
map <Leader>ww <C-W><C-W>
nnoremap K <ESC>i<Return><ESC>

