#!/bin/bash

echo "Installing Nix"
curl https://nixos.org/nix/install | sh
. ~/.nix-profile/etc/profile.d/nix.sh
mkdir -p ~/.config/nixpkgs/
ln -sf ~/programming/dotfiles/nixpkgs/config.nix ~/.config/nixpkgs/config.nix
