#!/bin/bash

echo "Install xcape"

# xcape
## I use xcape in conjunction with a simple script to make it where I can ## use
## \ and tab as the hyper modifier if held down, and work normally if ## quickly
## tapped.
git clone https://github.com/diminishedprime/xcape.git ~/temp/xcape > /dev/null 2>&1
cd ~/temp/xcape
sudo apt-get install git gcc make pkg-config libx11-dev libxtst-dev libxi-dev -y > /dev/null
make > /dev/null
sudo make install > /dev/null
