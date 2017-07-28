#!/bin/bash

echo "Installing zsh"
nix-env -i zsh-5.3.1

# Add simlink to /usr/bin/zsh for oh-my-zsh-installation to not freak out
sudo ln -sf $(which zsh) /usr/bin/zsh
sudo bash -c "echo '/usr/bin/zsh' >> /etc/shells"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/loket/oh-my-zsh/feature/batch-mode/tools/install.sh)" -s --batch || {
    echo "Could not install Oh My Zsh" >/dev/stderr
    exit 1
}
sudo sed -i '$ d' /etc/shells

ln -sf ~/programming/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/programming/dotfiles/zsh/.zshenv ~/.zshenv
