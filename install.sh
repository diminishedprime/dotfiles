#!/bin/bash

echo "Running the Ubuntu installation sequence"

echo "Bootstraping the installer directory"
sudo apt-get install git -y > /dev/null
# TODO: get rid of branch clone before merge into master
git clone -b cleaner-install https://github.com/diminishedprime/dotfiles.git ~/programming/dotfiles/ > /dev/null

~/programming/dotfiles/installs/install_emacs.sh

~/programming/dotfiles/installs/install_docker.sh

~/programming/dotfiles/installs/install_xcape.sh

~/programming/dotfiles/installs/install_source_code_pro.sh

~/programming/dotfiles/installs/install_spacemacs.sh

~/programming/dotfiles/installs/install_xmonad.sh

sudo apt-get install zsh -y > /dev/null

# # oh-my-zsh
# ## oh-my-zsh is a nice default configuration for zsh that adds some
# ## features.
# ln -sf ~/programming/dotfiles/.zshrc ~/.zshrc
# sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
