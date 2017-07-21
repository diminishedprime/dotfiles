#!/bin/bash

echo "Installing emacs"
nix-env -i emacs

# Spacemacs
git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d/
ln -sf ~/programming/dotfiles/emacs/.spacemacs ~/.spacemacs
