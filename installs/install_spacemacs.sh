#!/bin/bash

echo "Installing Spacemacs"
git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d/ > /dev/null
ln -sf ~/programming/dotfiles/.spacemacs ~/.spacemacs
