#!/bin/bash

echo "Installing San Francisco Fonts"
mkdir -p ~/temp/fonts
cd ~/temp/fonts
wget https://github.com/supermarin/YosemiteSanFranciscoFont/archive/master.zip
unzip master.zip
cd -
cd ~/temp/fonts/YosemiteSanFranciscoFont-master
mkdir -p ~/.fonts
cp *.ttf ~/.fonts
cd -
rm -rf ~/temp/fonts

echo "Installing Patched Powerline Fonts"
mkdir -p ~/temp/fonts
git clone --depth=1 https://github.com/powerline/fonts.git ~/temp/fonts
cd ~/temp/fonts
./install.sh
cd -
rm -rf ~/temp/fonts

echo "Installing Font Awesome"
sudo apt install fonts-font-awesome

echo "Installing Source Code Pro"
[ -d /usr/share/fonts/opentype ] || sudo mkdir /usr/share/fonts/opentype > /dev/null
sudo git clone --depth 1 --branch release https://github.com/adobe-fonts/source-code-pro.git /usr/share/fonts/opentype/scp > /dev/null 2>&1
sudo fc-cache -f -v > /dev/null 2>&1
