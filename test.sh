#!/bin/bash

read search
if iwconfig | grep -q wlan0mon
then
  echo "sachin"
else
  echo "ahuja"
fi
