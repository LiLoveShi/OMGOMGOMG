#!/bin/bash

cd ~/
echo "Starting wordpress2..."
docker-compose -f wordpress2/docker-compose.yml up -d

echo "Switch nginx to wordpress2..."
rm /etc/nginx/sites-enabled/*
cp nginx/wp2 /etc/nginx/sites-enabled/
service nginx reload

echo "Stopping wordpress1..."
docker-compose -f wordpress1/docker-compose.yml down
