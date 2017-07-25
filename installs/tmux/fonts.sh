#!/bin/bash

mkdir -p ~/temp/fonts
git clone --depth=1 https://github.com/powerline/fonts.git ~/temp/fonts
cd ~/temp/fonts
./install.sh
cd -
rm -rf ~/temp/fonts
