#!/bin/bash

echo "Installing emacs25 from ppa"
sudo add-apt-repository ppa:kelleyk/emacs -y > /dev/null
sudo apt-get update > /dev/null
sudo apt-get install emacs25 -y > /dev/null

# Spacemacs
git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d/ > /dev/null
ln -sf ~/programming/dotfiles/.spacemacs ~/.spacemacs

emacs --daemon > /dev/null &
