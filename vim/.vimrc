" Initialize {{{
set nocompatible
let mapleader = " "
execute pathogen#infect()
" }}}
" Solarized Colors {{{
let base03  = '#002b36'
let base02  = '#073642'
let base01  = '#586e75'
let base00  = '#657b83'
let base0   = '#839496'
let base1   = '#93a1a1'
let base2   = '#eee8d5'
let base3   = '#fdf6e3'
let yellow  = '#b58900'
let orange  = '#cb4b16'
let red     = '#dc322f'
let magenta = '#d33682'
let violet  = '#6c71c4'
let blue    = '#268bd2'
let cyan    = '#2aa198'
let green   = '#859900'
" }}}
" Colors & Fonts {{{
syntax enable
set background=dark
colorscheme solarized
exe 'highlight Visual guibg=' . base3
let g:airline_theme='solarized'
set termguicolors
set cursorline
exe 'highlight CursorLine guibg=' . base01
exe 'autocmd InsertEnter * highlight CursorLine guibg=' . base02
exe 'autocmd InsertLeave * highlight CursorLine guibg=' . base01
set guifont=Source\ Code\ Pro:h16
" }}}
" Folding {{{
nnoremap <Tab> za
set foldenable
set foldlevelstart=10
set foldmethod=syntax
set foldtext=MyFoldText()
exe 'highlight Folded guifg=' . base0
exe 'highlight Folded guibg=' . base02
" Make the fold stuff work
function! MyFoldText()
  let line = getline(v:foldstart)
  " There's a hack here where I use a character group of just { so this doesn't get matched itself.
  let sub = substitute(line, '/\*\|\*/\|{[{]{\d\=', '', 'g') 
  return v:folddashes . sub
endfunction
" }}}
" Indentation {{{
filetype plugin indent on
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
" }}}
" Autocommands {{{
augroup misc
  " Clears all the autocommands for the augroup
  autocmd!

  autocmd BufWritePre *.js,*.txt,*.md
        \:call <SID>StripTrailingWhitespaces()

  " .babelrc is a javascript file
  autocmd BufNewFile,BufRead .babelrc set filetype=javascript

  " enable spellchecking on txt and markdown
  autocmd BufNewFile,BufRead *.txt,*.md setlocal spell

  " enable spellchecking on a gitcommit
  autocmd Filetype gitcommit setlocal spell

augroup END
" }}}
" Backup & Undo {{{
set undofile
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" Gundo
nnoremap <leader>u :GundoToggle<CR>
" }}}
" Neovim Terminal Stuff {{{
:tnoremap <ESC> <C-\><C-n>
let g:term_buf = 0
function! ToggleTerminal()
  1wincmd w
 if g:term_buf == bufnr("")
    setlocal bufhidden=hide
    close
  else
    topleft vnew
    try
      exec "buffer ".g:term_buf
    catch
      call termopen("zsh", {"detach": 0})
      let g:term_buf = bufnr("")
    endtry
  endif
endfunction
" }}}
" Misc {{{
set ruler
set number
set showcmd
set incsearch
set hlsearch
set wildmenu
set diffopt+=vertical
set modelines=1
nnoremap K <ESC>i<Return><ESC>
cabbrev %s OverCommandLine<cr>%s
cabbrev '<,'>s OverCommandLine<cr>'<,'>s
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
" }}}

" Plugins
" EasyMotion {{{
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
" }}}
" CtrlP settings {{{
let g:ctrlp_match_window = 'bottom'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" }}}
" Airline {{{
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = '|'
let g:airline_right_alt_sep = '|'
let g:airline#entensions#branch#empty_message = 'No VC'
" }}}
" Autopairs {{{
let g:AutoPairsFlyMode = 1
" }}}
" Match Tag Always {{{
let g:mta_filetypes = {
  \ 'html': 1,
  \ 'xhtml': 1,
  \ 'xml': 1,
  \ 'javascript.jsx': 1,
  \}
" }}}
" CloseTag {{{
let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.jsx,*.md'
" }}}

" Language Specific
" Scheme {{{
augroup Scheme
  " Clears all the autocommands for the augroup
  autocmd!

  " For whatever reason, this will make it where run* indents 2 spaces instead
  " of a whole bunch. 
  autocmd BufNewFile,BufRead *.scm setlocal lispwords+=run*,run,fresh

augroup END
" }}}

" Spacemacs Style Bindings
" Toggles {{{
map <Leader>tt :call ToggleTerminal()<Return>
map <Leader>tn :set number!<Return>
map <Leader>tr :set relativenumber!<Return>
map <Leader>sc :nohlsearch<Return>
" }}}
" File {{{
map <Leader>ff :CtrlP<Return>
map <Leader>fed :edit ~/.vimrc<Return>
map <Leader>fs :update<Return>
" }}}
" Buffer {{{
map <Leader>bb :CtrlPBuffer<Return>
" }}}
" Quitting {{{
map <Leader>qq :q<Return>
map <Leader>qx :x<Return>
map <Leader>qr :source ~/programming/dotfiles/vim/.vimrc<Return>
" }}}
" Window {{{
map <Leader>w2 :vsplit<Return><Leader>wl
map <Leader>w3 :vsplit<Return>:vsplit<Return><Leader>wr=
map <Leader>w\ :vsplit<Return><Leader>wl
map <Leader>w- :split<Return><Leader>wj
map <Leader>wd :hide<Return>
map <Leader>ww <C-W><C-W>
map <Leader>wm :only<Return>
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
" Resize windows
" Equalize Vertically
map <Leader>wr= <C-W><C-=>
" Down
map <Leader>wrj <C-W>+<SID>ws
nn <script> <SID>wsj <C-W>+<SID>ws
" Up
map <Leader>wrk <C-W>-<SID>ws
nn <script> <SID>wsk <C-W>-<SID>ws
" Left
map <Leader>wrh :vertical resize +5<RETURN><SID>ws
nn <script> <SID>wsh :vertical resize +5<Return><SID>ws
" Right
map <Leader>wrl :vertical resize -5<Return><SID>ws
nn <script> <SID>wsl :vertical resize -5<Return><SID>ws
" }}}
" Git {{{
map <Leader>gs :Gstatus<Return>
map <Leader>gc :Gcommit<Return>
map <Leader>gp :Gpush<Return>
" Git hunk Things
let g:gitgutter_map_keys = 0
map <Leader>hs :GitGutterStageHunk<Return>
map <Leader>hx :GitGutterUndoHunk<Return>
map <Leader>hp :GitGutterPreviewHunk<Return>
map <Leader>hj :GitGutterNextHunk<Return>
map <Leader>hk :GitGutterPrevHunk<Return>
" }}}


" vim:foldmethod=marker:foldlevel=0
