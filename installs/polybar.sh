#!/bin/bash

echo "Installing Polybar"
nix-env -i polybar
mkdir -p ~/.config/polybar
ln -sf ~/programming/dotfiles/polybar/config ~/.config/polybar/config
