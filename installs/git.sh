#!/bin/bash

echo "Installing Git"
nix-env -i git
git config --global user.email "matthewjhamrick@gmail.com"
git config --global user.name "Matt Hamrick"
