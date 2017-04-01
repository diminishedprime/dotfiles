#!/bin/bash

echo "Installing Source Code Pro"
[ -d /usr/share/fonts/opentype ] || sudo mkdir /usr/share/fonts/opentype > /dev/null
sudo git clone --depth 1 --branch release https://github.com/adobe-fonts/source-code-pro.git /usr/share/fonts/opentype/scp > /dev/null
sudo fc-cache -f -v > /dev/null
