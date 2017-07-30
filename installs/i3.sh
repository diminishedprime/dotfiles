#!/bin/bash

echo "Installing i3"
ln -sf ~/programming/dotfiles/i3/config ~/.config/i3/config

~/programming/dotfiles/installs/xcape.sh
~/programming/dotfiles/installs/polybar.sh
~/programming/dotfiles/installs/rofi.sh
~/programming/dotfiles/installs/fonts.sh

# Symlink gtk settings
nix-env -i flat-plat-gtk-theme-20170605
sudo ln -sf ~/.nix-profile/share/themes/ ~/.themes
ln -sf ~/programming/dotfiles/gtk/gtk-2.0/.gtkrc-2.0 ~/.gtkrc-2.0
mkdir -p ~/.config/gtk-3.0
ln -sf ~/programming/dotfiles/gtk/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini
