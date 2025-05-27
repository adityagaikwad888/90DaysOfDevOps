#!/bin/bash

crontab -l > mycron

echo "* * * * * bash /home/ubuntu/Desktop/DevOps-Works/Shell-Scripts/backup.sh $1 $2" >> mycron

crontab mycron

rm mycron