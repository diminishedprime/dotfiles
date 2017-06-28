#!/bin/sh

echo "Making this a git repo, my man"
git init

echo "Setting up githooks"
~/programming/dotfiles/scripts/set-up-js-githooks.sh

echo "Copin over those files, my man"
cp -R ~/programming/dotfiles/js/base-project/. .

yarn install

git add .
git commit -am 'Initial commit'
