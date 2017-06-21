#!/bin/sh

echo "Setting up post-checkout hook"
ln -sf ~/programming/dotfiles/git/js-post-checkout-hook.sh ./.git/hooks/post-checkout

echo "Setting up pre-commit hook"
ln -sf ~/programming/dotfiles/git/js-pre-commit-hook.sh ./.git/hooks/pre-commit
