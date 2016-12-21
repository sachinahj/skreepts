#!/bin/bash

echo "--- inverting mouse and trackpad scrolling"
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll false
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false

echo "--- enabling gTile"
gnome-shell-extension-tool -e gTile@vibou

echo "--- installing bettercap"
apt-get install bettercap -y

echo "--- installing bridge-utils"
apt-get install bridge-utils -y
