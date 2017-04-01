#!/bin/bash

echo "Installing Docker"

sudo apt-get install \
     apt-transport-https \
     ca-certificates \
     curl \
     software-properties-common -y > /dev/null

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - > /dev/null
sudo add-apt-repository \
     "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable" > /dev/null

sudo apt-get update > /dev/null
sudo apt-get install docker-ce -y > /dev/null
