#!/bin/bashn

echo "Installing emacs25 from ppa"
sudo add-apt-repository ppa:kelleyk/emacs -y
sudo apt-get update
sudo apt-get install emacs25 -y
