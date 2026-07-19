#!/bin/bash
set -eux

export DEBIAN_FRONTEND=noninteractive

apt-get update -y

apt-get install -y mysql-server

systemctl enable mysql
systemctl start mysql

echo "MySQL Installed Successfully" > /home/ubuntu/database.txt
