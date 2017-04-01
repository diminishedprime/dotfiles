#!/bin/bash
#

echo "installing xmonad"

# Installation script which setup up an Ubuntu Xenial machine to use this xmonad
# configuration.
#
# WARNING!!!
# * This has only been tested on a limited number of machines running
#   Ubuntu 16.04 64-bit.
# * This is not a sophisticated installation script by any stretch
#   of the imagination.
# * I take no responsibility if this overwrites any configuration settings
#   or otherwise messes up your system.
#
# Please review the readme file to find out exactly what it does and does not
# do. Or, visit the repository for more information:
# https://github.com/davidbrewer/xmonad-ubuntu-conf
#
# Author: David Brewer

echo "Installing required packages..."
sudo apt-get install xmonad libghc-xmonad-dev libghc-xmonad-contrib-dev xmobar xcompmgr nitrogen stalonetray moreutils consolekit synapse ssh-askpass-gnome thunar chromium-browser -y

echo "Creating xmonad xsession configuration..."
sudo mv /usr/share/xsessions/xmonad.desktop /usr/share/xsessions/xmonad.desktop.original
sudo cp ~/programming/dotfiles/.xmonad/xmonad.desktop /usr/share/xsessions/
sudo chmod a+r /usr/share/xsessions/xmonad.desktop

mkdir -p /usr/share/unity-greeter/
sudo cp ~/programming/dotfiles/.xmonad/images/custom_xmonad_badge.png /usr/share/unity-greeter/
sudo chmod a+r /usr/share/unity-greeter/custom_xmonad_badge.png

# TODO: I'm not sure if I actually need this, but I'm keeping it for now
echo "Linking to customized gnome 2 configuration..."
mv ~/.gtkrc-2.0 ~/.gtkrc-2.0.original
cp ~/programming/dotfiles/.xmonad/.gtkrc-2.0 ~/

ln -sf ~/programming/dotfiles/.xmonad/xmonad.hs ~/.xmonad/xmonad.hs
ln -sf ~/programming/dotfiles/.xmonad/start-xmonad ~/.xmonad/start-xmonad
ln -sf ~/programming/dotfiles/.xmonad/startup-hook ~/.xmonad/startup-hook
ln -sf ~/programming/dotfiles/.xmonad/xmobarrc ~/.xmonad/xmobarrc
