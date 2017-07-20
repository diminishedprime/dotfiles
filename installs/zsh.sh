#!/bin/bash
echo "Installing zsh"
nix-env -i zsh-5.3.1

sh -c "$(curl -fsSL https://raw.githubusercontent.com/loket/oh-my-zsh/feature/batch-mode/tools/install.sh)" -s --batch || {
    echo "Could not install Oh My Zsh" >/dev/stderr
    exit 1
}

ln -sf ~/programming/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/programming/dotfiles/zsh/.zshenv ~/.zshenv
