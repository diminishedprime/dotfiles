#!/bin/bash

echo "Installing Polybar"
~/programming/dotfiles/installs/light.sh
~/programming/dotfiles/installs/fonts.sh
nix-env -i polybar
mkdir -p ~/.config/polybar
ln -sf ~/programming/dotfiles/polybar/config ~/.config/polybar/config
