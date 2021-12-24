#!/bin/bash

cd /home/yc-user;

# Install git
apt-get update;
apt install git

# Clone repository
git clone -b monolith https://github.com/express42/reddit.git

# Install dependencies
cd reddit && bundle install

# Run server
puma -d
