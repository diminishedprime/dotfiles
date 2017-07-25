#!/bin/bash
nix-env -i tmux

mkdir -p ~/temp/fonts
git clone --depth=1 https://github.com/powerline/fonts.git ~/temp/fonts
cd ~/temp/fonts
./install.sh
cd -
rm -rf ~/temp/fonts

ln -sf ~/programming/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -sf ~/programming/dotfiles/tmux/.tmux.conf.local ~/.tmux.conf.local    
