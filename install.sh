#!/bin/bash

echo "Installing Deluge Docker..."

apt update
apt install -y docker.io git

systemctl enable docker
systemctl start docker

git clone https://github.com/race-in/deluge1.3.15-docker.git

cd deluge1.3.15-docker

docker build -t deluge13 .

docker run -d \
--name deluge13 \
--network host \
-v $(pwd)/downloads:/downloads \
-v $(pwd)/config:/root/.config/deluge \
deluge13

echo "================================="
echo "Deluge Installed"
echo "WebUI → http://SERVER_IP:8113"
echo "Password → deluge"
echo "================================="
