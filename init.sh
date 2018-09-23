#!/bin/bash
echo "update apt"
apt update >/dev/null 2>&1

echo "install nginx curl mysql-client"
apt install -y nginx curl mysql-client >/dev/null 2>&1
service nginx start

echo "install docker"

cd ~/
curl -fsSL get.docker.com -o get-docker.sh >/dev/null 2>&1
sh get-docker.sh
service docker start

curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

mkdir wordpressOld && cd wordpressOld
wget https://raw.githubusercontent.com/LiLoveShi/OMGOMGOMG/wordpressOld/docker-compose.yml
cd ~

mkdir wordpressNew && cd wordpressNew
wget https://raw.githubusercontent.com/LiLoveShi/OMGOMGOMG/wordpressNew/docker-compose.yml
cd ~

mkdir mysql && cd mysql
wget https://raw.githubusercontent.com/LiLoveShi/OMGOMGOMG/mysql/docker-compose.yml
cd ~




# # git clone <mysql>
# docker-compose -f mysql/docker-compose.yml up -d

# # git clone <wordpress1>
# docker-compose -f wordpress1/docker-compose.yml up -d

# # git clone <nginx>
# rm /etc/nginx/sites-enabled/*
# cp nginx/wp1 /etc/nginx/sites-enabled/
# service nginx reload

