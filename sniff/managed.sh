#!/bin/bash

if iwconfig | grep -q wlan0mon
then
  echo "---stopping airmon-ng monitor mode wlan0mon"
  airmon-ng stop wlan0mon
else
  echo "---doing nothing. no wlan0mon deviced detected."
fi

echo "---starting network-manager service"
service network-manager start

echo "---airmon-ng checking wlan0"
airmon-ng check wlan0
