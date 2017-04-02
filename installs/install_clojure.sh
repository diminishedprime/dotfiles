#!/bin/bash

sudo apt-get install openjdk-8-jdk -y > /dev/null 2>&1

wget https://raw.github.com/technomancy/leiningen/stable/bin/lein -O ~/temp/lein
chmod +x ~/temp/lein
sudo mv ~/temp/lein /usr/local/bin/
lein
