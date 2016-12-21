#!/bin/bash

echo "--- setting /proc/sys/net/ipv4/ip_forward to 0"
echo 0 > /proc/sys/net/ipv4/ip_forward
cat /proc/sys/net/ipv4/ip_forward

echo "--- deleting ALL PREROUTING from iptables"
iptables -t nat -F PREROUTING
iptables -t nat -L PREROUTING

echo "--- deleting ALL ACCEPT to iptables"
iptables -F INPUT
iptables -L INPUT
