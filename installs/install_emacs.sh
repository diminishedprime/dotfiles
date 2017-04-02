#!/bin/bash

echo "Installing emacs"

sudo add-apt-repository ppa:kelleyk/emacs -y > /dev/null 2>&1
sudo apt-get update > /dev/null 2>&1
sudo apt-get install emacs25 -y > /dev/null 2>&1

# Spacemacs
git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d/ > /dev/null 2>&1
ln -sf ~/programming/dotfiles/emacs/.spacemacs ~/.spacemacs

emacs --daemon > /dev/null 2>&1 &
