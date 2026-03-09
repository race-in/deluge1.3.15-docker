#!/bin/bash

CONFIG="/root/.config/deluge"

mkdir -p $CONFIG

cp -n /core.conf $CONFIG/core.conf
cp -n /ltconfig.conf $CONFIG/ltconfig.conf

echo "Starting Deluge daemon..."
deluged -d

sleep 8

echo "Starting WebUI..."
deluge-web --fork --port 8113

tail -f /dev/null
