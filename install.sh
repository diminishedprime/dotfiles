#!/bin/bash

python -mplatform | grep -qi Ubuntu && PLATFORM="ubuntu"
python -mplatform | grep -qi Darwin && PLATFORM="darwin"

mkdir -p ~/programming/dotfiles/

if [ "$PLATFORM" == "ubuntu" ]
then
    echo "Running the Ubuntu installation sequence"

    sudo add-apt-repository ppa:kelleyk/emacs
    sudo apt-get update
    sudo apt-get install git zsh emacs25 gcc make pkg-config libx11-dev libxtst-dev libxi-dev

    # xcape
    ## I use xcape in conjunction with a simple script to make it where I can
    ## use \ and tab as the hyper modifier if held down, and work normally if
    ## quickly tapped.
    git clone https://github.com/diminishedprime/xcape.git ~/temp/xcape
    cd ~/temp/xcape
    make
    sudo make install

    # oh-my-zsh
    ## oh-my-zsh is a nice default configuration for zsh that adds some
    ## features.
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

    # dotfiles
    ## I go ahead and close this repo since many of my config files are stored
    ## here. This allows me to symlink all the files I care about.
    git clone https://github.com/diminishedprime/dotfiles.git ~/programming/dotfiles/

fi

if [ "$PLATFORM" == "darwin" ]
then
    echo "This is running darwin"
fi

echo "Running the installation sequence common to darwin and ubuntu"
