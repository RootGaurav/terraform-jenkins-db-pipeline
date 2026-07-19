#!/bin/bash
set -eux

export DEBIAN_FRONTEND=noninteractive

apt-get update -y

apt-get install -y curl gnupg

curl -fsSL https://pgp.mongodb.com/server-7.0.asc | \
gpg --dearmor -o /usr/share/keyrings/mongodb-server.gpg

echo "deb [ signed-by=/usr/share/keyrings/mongodb-server.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" \
> /etc/apt/sources.list.d/mongodb-org.list

apt-get update -y

apt-get install -y mongodb-org

systemctl enable mongod
systemctl start mongod

echo "MongoDB Installed Successfully" > /home/ubuntu/database.txt
