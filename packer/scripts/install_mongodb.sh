#!/bin/bash

# Install keys
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | apt-key add -

# Add Mongodb repo
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | \
tee /etc/apt/sources.list.d/mongodb-org-4.2.list

# Install Mongodb
apt-get update;
sleep 3m
apt-get install -y mongodb-org

# Run Mongodb
systemctl start mongod
systemctl enable mongod
