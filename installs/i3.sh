#!/bin/bash

echo "Installing i3"
ln -sf ~/programming/dotfiles/i3/config ~/.config/i3/config

~/programming/dotfiles/installs/xcape.sh
~/programming/dotfiles/installs/rofi.sh
