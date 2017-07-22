#!/bin/bash
nix-env -i tmux

ln -sf ~/programming/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -sf ~/programming/dotfiles/tmux/.tmux.conf.local ~/.tmux.conf.local    
