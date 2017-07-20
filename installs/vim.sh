nix-env -i vim
ln -sf ~/programming/dotfiles/vim/.vimrc ~/.vimrc
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone --depth=1 https://github.com/easymotion/vim-easymotion ~/.vim/bundle/vim-easymotion
git clone --depth=1 https://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized
git clone --depth=1 https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
git clone --depth=1 https://github.com/pangloss/vim-javascript.git ~/.vim/bundle/vim-javascript
git clone --depth=1 https://github.com/mxw/vim-jsx.git ~/.vim/bundle/vim-jsx
git clone --depth=1 https://github.com/vim-syntastic/syntastic.git ~/.vim/bundle/syntastic
git clone --depth=1 https://github.com/tpope/vim-surround.git ~/.vim/bundle/vim-surround
git clone --depth=1 https://github.com/tpope/vim-repeat.git ~/.vim/bundle/vim-repeat
