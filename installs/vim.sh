nix-env -i neovim
# Symlink as vim
sudo ln -sf $(which nvim) /usr/local/bin/vim

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
git clone --depth=1 https://github.com/vim-syntastic/syntastic.git ~/.config/nvim/bundle/syntastic
git clone --depth=1 https://github.com/tpope/vim-surround.git ~/.config/nvim/bundle/vim-surround
git clone --depth=1 https://github.com/tpope/vim-repeat.git ~/.config/nvim/bundle/vim-repeat
