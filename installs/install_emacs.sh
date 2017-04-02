#!/bin/bash

echo "Installing emacs"

sudo add-apt-repository ppa:kelleyk/emacs -y > /dev/null
sudo apt-get update > /dev/null
sudo apt-get install emacs25 -y > /dev/null

# Spacemacs
git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d/ > /dev/null
ln -sf ~/programming/dotfiles/emacs/.spacemacs ~/.spacemacs

emacs --daemon > /dev/null 2>&1 &
