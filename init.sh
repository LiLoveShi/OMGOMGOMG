#!/bin/bash

apt update

apt install -y nginx curl mysql-client
service nginx start

cd ~/
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh
service docker start

curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# git clone <mysql>
docker-compose -f mysql/docker-compose.yml up -d

# git clone <wordpress1>
docker-compose -f wordpress1/docker-compose.yml up -d

# git clone <nginx>
rm /etc/nginx/sites-enabled/*
cp nginx/wp1 /etc/nginx/sites-enabled/
service nginx reload

