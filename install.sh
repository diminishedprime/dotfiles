#!/bin/bash

python -mplatform | grep -qi Ubuntu && PLATFORM="ubuntu"
python -mplatform | grep -qi Darwin && PLATFORM="darwin"

mkdir -p ~/programming/dotfiles/

if [ "$PLATFORM" == "ubuntu" ]
then
    echo "Running the Ubuntu installation sequence"

    sudo add-apt-repository ppa:kelleyk/emacs -y
    sudo apt-get update
    sudo apt-get install git zsh emacs25 gcc make pkg-config libx11-dev libxtst-dev libxi-dev -y

    # xcape
    ## I use xcape in conjunction with a simple script to make it where I can
    ## use \ and tab as the hyper modifier if held down, and work normally if
    ## quickly tapped.
    git clone https://github.com/diminishedprime/xcape.git ~/temp/xcape
    cd ~/temp/xcape
    make
    sudo make install
    # Script for keybindings
    echo "~/programming/dotfiles/set_up_hyper_modifiers.sh" >> ~/.profile

    # dotfiles
    ## I go ahead and close this repo since many of my config files are stored
    ## here. This allows me to symlink all the files I care about.
    git clone https://github.com/diminishedprime/dotfiles.git ~/programming/dotfiles/

    # Source Code Pro
    [ -d /usr/share/fonts/opentype ] || sudo mkdir /usr/share/fonts/opentype
    sudo git clone --depth 1 --branch release https://github.com/adobe-fonts/source-code-pro.git /usr/share/fonts/opentype/scp
    sudo fc-cache -f -v

    # Spacemacs
    git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d/
    ln -sf ~/programming/dotfiles/.spacemacs ~/.spacemacs

    # Xmonad
    git clone https://github.com/davidbrewer/xmonad-ubuntu-conf.git ~/
    ~/xmonad-ubuntu-conf/install-xmonad


    # oh-my-zsh
    ## oh-my-zsh is a nice default configuration for zsh that adds some
    ## features.
    ln -sf ~/programming/dotfiles/.zshrc ~/.zshrc
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

fi

if [ "$PLATFORM" == "darwin" ]
then
    echo "This is running darwin"
fi
