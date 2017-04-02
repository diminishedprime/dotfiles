#!/bin/bash

sudo apt-get install zsh -y > /dev/null

echo "Installing zsh"

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

ln -sf ~/programming/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/programming/dotfiles/zsh/.zshenv ~/.zshenv
