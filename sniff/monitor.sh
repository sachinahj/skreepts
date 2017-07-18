DEFAULT_CHANNEL=153
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

CHANNEL=${CHANNEL:-$DEFAULT_CHANNEL}


echo "checking if already in monitor mode [iwconfig]"
if iwconfig | grep -q wlan0mon
then
  echo "--- wlan0mon detected. killing..."
  DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  $DIR/managed.sh
else
  echo "--- wlan0mon not detected."
fi

echo "kill airmong-ng check processes [airmon-ng check kill]"
airmon-ng check kill

echo "--- starting monitor mode on channel $CHANNEL [airmon-ng start wlan0 $CHANNEL]"
airmon-ng start wlan0 $CHANNEL

echo "--- started monitor mode on channel $CHANNEL [iwconfig]"
iwconfig

echo "=== maybe these commands can help next ==="
echo "airodump-ng wlan0mon --band abg"
echo "airodump-ng wlan0mon -c $CHANNEL --bssid "
echo "aireplay-ng wlan0mon -0 0 -a "
echo "=========================================="
