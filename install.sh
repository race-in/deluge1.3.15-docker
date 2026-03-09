#!/bin/bash

apt update
apt install -y docker.io git

git clone https://github.com/race-in/deluge1.3.15-docker.git

cd deluge1.3.15-docker

bash deploy.sh
