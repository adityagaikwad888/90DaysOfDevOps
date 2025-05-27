#!/bin/bash

echo "This is the Backup of $1" > "$2/Info.txt"

src="$1"
backup="$2"


timestamp="$(date '+%F_%H-%M-%S')"

zip -r "$backup/backup_$timestamp.zip" $src > /dev/null

ls -t "$2" | tail -n +5 | xargs -I {} rm -f "$2/{}"