#!/bin/bash

echo "Installing emacs25 from ppa"
sudo add-apt-repository ppa:kelleyk/emacs -y > /dev/null
sudo apt-get update > /dev/null
sudo apt-get install emacs25 -y > /dev/null
