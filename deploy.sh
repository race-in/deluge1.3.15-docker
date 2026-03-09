#!/bin/bash

docker rm -f deluge13 2>/dev/null

docker build -t deluge13 .

docker run -d \
--name deluge13 \
--network host \
-v $(pwd)/downloads:/downloads \
-v $(pwd)/config:/root/.config/deluge \
deluge13
