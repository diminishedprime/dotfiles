#!/bin/bash

echo "Install xcape"

# xcape
## I use xcape in conjunction with a simple script to make it where I can ## use
## \ and tab as the hyper modifier if held down, and work normally if ## quickly
## tapped.
git clone https://github.com/diminishedprime/xcape.git ~/temp/xcape
cd ~/temp/xcape
make
sudo make install
