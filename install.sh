#!/bin/bash

echo "Running the Ubuntu installation sequence"

echo "Bootstraping the installer directory"
sudo apt-get install git -y > /dev/null
# TODO: get rid of branch clone before merge into master
git clone -b cleaner-install https://github.com/diminishedprime/dotfiles.git ~/programming/dotfiles/ > /dev/null

~/programming/dotfiles/installs/install_emacs.sh

~/programming/dotfiles/installs/install_docker.sh

~/programming/dotfiles/installs/install_xcape.sh

sudo apt-get install zsh -y > /dev/null

# sudo apt-get install gcc make pkg-config libx11-dev libxtst-dev libxi-dev -y

# # Source Code Pro
# [ -d /usr/share/fonts/opentype ] || sudo mkdir /usr/share/fonts/opentype
# sudo git clone --depth 1 --branch release https://github.com/adobe-fonts/source-code-pro.git /usr/share/fonts/opentype/scp
# sudo fc-cache -f -v

# # Spacemacs
# git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d/
# ln -sf ~/programming/dotfiles/.spacemacs ~/.spacemacs

# # Xmonad
# git clone https://github.com/diminishedprime/xmonad-ubuntu-conf.git ~/.xmonad
# ~/.xmonad/install-xmonad

# # oh-my-zsh
# ## oh-my-zsh is a nice default configuration for zsh that adds some
# ## features.
# ln -sf ~/programming/dotfiles/.zshrc ~/.zshrc
# sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
