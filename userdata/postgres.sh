#!/bin/bash
set -eux

export DEBIAN_FRONTEND=noninteractive

apt-get update -y

apt-get install -y postgresql postgresql-contrib

systemctl enable postgresql
systemctl start postgresql

echo "PostgreSQL Installed Successfully" > /home/ubuntu/database.txt
