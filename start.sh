#!/bin/bash

CONFIG="/root/.config/deluge"

mkdir -p $CONFIG

cp -n /core.conf $CONFIG/core.conf
cp -n /ltconfig.conf $CONFIG/ltconfig.conf

deluged -d

sleep 8

deluge-web --fork --port 8113

tail -f /dev/null
