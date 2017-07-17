#!/bin/bash

read search
if iwconfig | grep -q wlan0mon
then
  echo "sachin"
else
  echo "ahuja"
fi


# sudo arp-scan -l -I wlan0
# sudo nmap -sT -O --osscan-guess 192.168.1.4
