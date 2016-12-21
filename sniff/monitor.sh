#!/bin/bash
while [[ $# -gt 1 ]]
do
key="$1"
case $key in
    -c|--channel)
    CHANNEL="$2"
    shift # past argument
    ;;
    *)
            # unknown option
    ;;
esac
shift # past argument or value
done

CHANNEL=${CHANNEL:-"36"}


if iwconfig | grep -q wlan0mon
then
  echo "--- doing nothing. wlan0mon already detected."
else

  echo "kill airmong-ng check processes"
  airmon-ng check kill

  echo "--- starting monitor mode on channel $CHANNEL"
  airmon-ng start wlan0 $CHANNEL

  echo "--- started monitor mode on channel $CHANNEL"
  iwconfig
fi

echo "=== maybe these commands can help next ==="
echo "airodump-ng wlan0mon --band abg"
echo "airodump-ng wlan0mon -c $CHANNEL --bssid "
echo "aireplay-ng wlan0mon -0 0 -a "
echo "=========================================="
