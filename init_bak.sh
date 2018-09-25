#!/bin/bash

cd ~/
wget https://raw.githubusercontent.com/LiLoveShi/OMGOMGOMG/master/backup_db.sh
if [ "$(crontab -l | grep 'no crontab' | wc -l)" -gt 0 ];then
    echo "0 * * * * /bin/bash /usr/local/backup_db.sh &" > mycron
    crontab mycron
    rm mycron
elif [ "$(crontab -l | grep backup_db.sh | wc -l)" -eq 0 ];then
    crontab -l > mycron
    echo "0 * * * * /bin/bash /usr/local/backup_db.sh &" >> mycron
    crontab mycron
    rm mycron
fi