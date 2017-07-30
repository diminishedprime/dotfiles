#!/bin/bash

mkdir -p ~/temp
git clone https://github.com/haikarainen/light.git ~/temp/light
cd ~/temp/light
sudo make && sudo make install
rm -rf ~/temp/light
