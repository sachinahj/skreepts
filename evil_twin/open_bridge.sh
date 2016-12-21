#!/bin/bash

# airbase-ng wlan0mon -a 20:10:7A:C1:F3:E0 --essid "robot_net" -c 36

echo "--- initial bridge set up"
brctl show

echo "--- adding bridge controller - evil"
brctl addbr evil

echo "--- adding interface to evil - eth0"
brctl addif evil eth0

echo "--- adding interface to evil - at0"
brctl addif evil at0

echo "--- bringing up at0"
ifconfig at0 0.0.0.0 up

echo "--- bringing up evil"
ifconfig evil up

echo "--- starting dhclient3"
service smbd start


echo "--- final bridge set up"
brctl show

echo "=== maybe these commands can help next ==="
echo "=== bridge opened ==="
