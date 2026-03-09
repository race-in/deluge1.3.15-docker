#!/bin/bash

echo "Installing Deluge 1.3.15 Docker..."

# install dependencies
apt update
apt install -y docker.io git

systemctl enable docker
systemctl start docker

# clone project
git clone https://github.com/race-in/deluge1.3.15-docker.git

cd deluge1.3.15-docker

# run deploy
bash deploy.sh
