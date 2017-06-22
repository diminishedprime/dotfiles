#!/bin/sh

echo "Setting up githooks"
~/programming/dotfiles/scripts/set-up-js-githooks.sh

echo "Copying over .gitignore"
cp ~/programming/dotfiles/js/.gitignore .gitignore

echo "Copying over .eslintrc.js"
cp ~/programming/dotfiles/js/.eslintrc.js .eslintrc.js

echo "Installing deps needed for .eslintrc"
yarn add -D \
     eslint \
     eslint-plugin-redux-saga \
     eslint-plugin-react

echo "Installing react state-management"
yarn add -D \
     redux \
     react-redux \
     redux-saga


echo "Installing deps needed for fancy npm server stuff"
yarn add -D \
     babel-cli \
     babel-preset-es2015 \
     express \
     nodemon \
     npm-run-all

echo "Coping over the api folder"
mkdir -p api
cp -R ~/programming/dotfiles/js/api/ .
