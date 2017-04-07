#!/bin/bash

sudo apt-get install ruby -y > /dev/null
sudo ln -sf ~/programming/dotfiles/scripts/clone-all-gitrepos.sh /usr/local/bin/clone-all-gitrepos.sh

sudo ln -sf ~/programming/dotfiles/scripts/open_finances.sh /usr/local/bin/open_finances.sh
