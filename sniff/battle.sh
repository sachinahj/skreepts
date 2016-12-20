#!/bin/bash

if iwconfig | grep -q wlan0mon
then
  echo "---doing nothing. wlan0mon already detected."
else

  echo "kill airmong-ng check processes"
  airmon-ng check kill

  echo "---what channel?"
  read channel

  echo "---starting monitor mode on channel $channel"
  airmon-ng start wlan0 $channel

  echo "---started monitor mode on channel $channel"
  iwconfig
fi

echo "airodump-ng wlan0mon --band abg"

#echo "---airodump-ng wlan0mon -c 36 --bssid "
#echo "---aireplay-ng wlan0mon -0 0 -a "
