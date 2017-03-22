# dotfiles

## First Time Setup
```sh
wget https://raw.githubusercontent.com/diminishedprime/dotfiles/master/install.sh -O ~/temp/install.sh && \
chmod +x ~/temp/install.sh && \
sudo ~/temp/install.sh
```

### Docker
```sh
mkdir -p ~/temp/
apt-get update && \
apt-get install software-properties-common sudo python python-software-properties wget -y && \
wget https://raw.githubusercontent.com/diminishedprime/dotfiles/master/install.sh -O ~/temp/install.sh && \
chmod +x ~/temp/install.sh && \
~/temp/install.sh
```
