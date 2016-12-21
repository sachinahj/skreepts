#!/bin/bash

echo "--- updating apt-get"
sudo apt-get update -y

echo "--- upgrading apt-get"
sudo apt-get upgrade -y

echo "--- installing new linux headers"
sudo apt-get install linux-headers-$(uname -r) -y

echo "--- dist-upgrading apt-get"
sudo apt update
sudo apt dist-upgrade -y

echo "--- creating gnome extensions folder"
mkdir -p ~/.local/share/gnome-shell/extensions

echo "--- cloning gTile into gnome-shell extensions folder"
git clone https://github.com/lundal/vibou.gTile.git ~/.local/share/gnome-shell/extensions/gTile@vibou

echo "---rebooting in 10 seconds"
sleep 10
reboot
