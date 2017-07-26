#!/bin/bash

echo "Installing nvim"
nix-env -i neovim

ln -sf ~/programming/dotfiles/vim/.vimrc ~/.config/nvim/init.vim

mkdir -p ~/.config/nvim/autoload
mkdir -p ~/.config/nvim/bundle

# Get pathogen set up
curl -LSso ~/.config/nvim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

git clone --depth=1 https://github.com/easymotion/vim-easymotion ~/.config/nvim/bundle/vim-easymotion
git clone --depth=1 https://github.com/altercation/vim-colors-solarized.git ~/.config/nvim/bundle/vim-colors-solarized
git clone --depth=1 https://github.com/ctrlpvim/ctrlp.vim.git ~/.config/nvim/bundle/ctrlp.vim
git clone --depth=1 https://github.com/pangloss/vim-javascript.git ~/.config/nvim/bundle/vim-javascript
git clone --depth=1 https://github.com/mxw/vim-jsx.git ~/.config/nvim/bundle/vim-jsx
git clone --depth=1 https://github.com/tpope/vim-surround.git ~/.config/nvim/bundle/vim-surround
git clone --depth=1 https://github.com/tpope/vim-repeat.git ~/.config/nvim/bundle/vim-repeat
git clone --depth=1 https://github.com/vim-airline/vim-airline ~/.config/nvim/bundle/vim-airline
git clone --depth=1 https://github.com/vim-airline/vim-airline-themes ~/.config/nvim/bundle/vim-airline-themes
git clone --depth=1 https://github.com/osyo-manga/vim-over.git ~/.config/nvim/bundle/vim-over

git clone --depth=1 https://github.com/tpope/vim-fugitive.git ~/.config/nvim/bundle/vim-fugitive
vim -u NONE -c "helptags vim-fugitive/doc" -c q
git clone --depth=1 https://github.com/airblade/vim-gitgutter.git ~/.config/nvim/bundle/vim-gitgutter
