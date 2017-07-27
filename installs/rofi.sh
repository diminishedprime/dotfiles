#!/bin/bash

echo "Installing rofi"
nix-env -i rofi
mkdir -p ~/.config/rofi
ln -sf ~/programming/dotfiles/rofi/config ~/.config/rofi/config
