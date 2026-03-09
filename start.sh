#!/bin/bash

CONFIG="/root/.config/deluge"

mkdir -p $CONFIG
mkdir -p $CONFIG/state
mkdir -p $CONFIG/plugins

# auth file create
if [ ! -f $CONFIG/auth ]; then
echo "localclient:deluge:10" > $CONFIG/auth
fi

# ltconfig plugin
if [ ! -f $CONFIG/plugins/ltConfig-0.3.1-py2.7.egg ]; then
wget -q https://github.com/ratanakvlun/deluge-ltconfig/releases/download/v0.3.1/ltConfig-0.3.1-py2.7.egg -O $CONFIG/plugins/ltConfig-0.3.1-py2.7.egg
fi

echo "Starting Deluge daemon..."
deluged -d

sleep 5

echo "Starting Deluge WebUI..."
deluge-web --fork --port 8113

echo "Deluge started"

tail -f /dev/null
