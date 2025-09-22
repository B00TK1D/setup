#!/bin/sh

sudo apt update
sudo apt upgrade -y
sudo apt install -y zip gzip iputils-ping traceroute htop tmux neovim tcpdump gh wireguard build-essential zip btop nginx certbot python3-certbot-nginx apache2-utils pigz jq pv python3-pip

curl -fsSL https://get.docker.com | sh

curl -fsSLo- https://s.id/golang-linux | bash
echo 'export GOROOT="$HOME/go"' >> ~/.profile
echo 'export GOPATH="$HOME/go/packages"' >> ~/.profile
echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> ~/.profile
source ~/.profile

mkdir -p ~/.config/pip
echo "[global]" >> ~/.config/pip/pip.conf
echo "break-system-packages = true" >> ~/.config/pip/pip.conf


