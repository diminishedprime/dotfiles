ln -sf ~/programming/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -sf ~/programming/dotfiles/tmux/.tmux.conf.local ~/.tmux.conf.local

platform=`uname`
if [[ "$platform" == "Darwin" ]]; then
  ln -sf ~/programming/dotfiles/tmux/.tmux-osx.conf ~/.tmux-osx.conf
fi
