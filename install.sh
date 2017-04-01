#!/bin/bash

echo "Running the Ubuntu installation sequence"

echo "Bootstraping the installer directory"
sudo apt-get install git -y > /dev/null
git clone https://github.com/diminishedprime/dotfiles.git ~/programming/dotfiles/ > /dev/null

~/programming/dotfiles/installs/install_emacs.sh

~/programming/dotfiles/installs/install_docker.sh

~/programming/dotfiles/installs/install_xcape.sh

~/programming/dotfiles/installs/install_source_code_pro.sh

~/programming/dotfiles/installs/install_xmonad.sh

~/programming/dotfiles/installs/install_zsh.sh

~/programming/dotfiles/installs/install_scripts.sh
