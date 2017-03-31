# dotfiles

## First Time Setup
```sh
mkdir -p ~/temp/
wget https://raw.githubusercontent.com/diminishedprime/dotfiles/master/install.sh -O ~/temp/install.sh && \
chmod +x ~/temp/install.sh && \
~/temp/install.sh
```

### Docker
```sh
mkdir -p ~/temp/
apt-get update && \
apt-get install sudo wget -y && \
wget https://raw.githubusercontent.com/diminishedprime/dotfiles/cleaner-install/install.sh  -O ~/temp/install.sh && \
chmod +x ~/temp/install.sh && \
~/temp/install.sh
```
