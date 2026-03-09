#!/bin/bash

CONFIG="/root/.config/deluge"

mkdir -p $CONFIG/state
mkdir -p $CONFIG/plugins

echo "Starting Deluge daemon..."
deluged -d

sleep 5

echo "Starting WebUI..."
deluge-web --fork --port 8113

echo "Deluge started"

tail -f /dev/null
