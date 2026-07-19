#!/bin/bash
set -eux

export DEBIAN_FRONTEND=noninteractive

apt-get update -y

apt-get install -y redis-server

systemctl enable redis-server
systemctl start redis-server

echo "Redis Installed Successfully" > /home/ubuntu/database.txt
