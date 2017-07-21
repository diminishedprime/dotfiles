#!/bin/bash
nix-env -i tmux
ln -sf ~/programming/dotfiles/tmux/.tmux.conf ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
