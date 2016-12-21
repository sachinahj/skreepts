#!/bin/bash

echo "--- initial bridge set up"
brctl show

echo "--- bringing down evil"
ifconfig evil down

echo "--- adding bridge controller - evil"
brctl delbr evil

echo "--- stopping smbd"
service smbd stop

echo "--- final bridge set up"
brctl show

echo "=== maybe these commands can help next ==="
echo "=== bridge closed ==="
