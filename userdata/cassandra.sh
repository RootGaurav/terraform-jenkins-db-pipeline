#!/bin/bash
set -eux

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get install -y docker.io

systemctl enable docker
systemctl start docker

usermod -aG docker ubuntu

docker run -d \
  --name cassandra \
  --restart unless-stopped \
  -p 9042:9042 \
  -e MAX_HEAP_SIZE=128M \
  -e HEAP_NEWSIZE=64M \
  cassandra:5.0


echo "Cassandra Ready" > /home/ubuntu/database.txt