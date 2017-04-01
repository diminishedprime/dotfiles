sudo apt-get install zsh -y > /dev/null

echo "Installing zsh"
ln -sf ~/programming/dotfiles/.zshrc ~/.zshrc

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
