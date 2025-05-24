#!/bin/bash

backup="/home/ubuntu/Desktop/DevOps-Works"

destination="/mnt/backups"

day=$(date +%A)

hostname=$(hostname -s)

archive="$hostname-$day.tgz"

tar czf "$destination/$archive" "$backup"

echo "Backup Finished"

