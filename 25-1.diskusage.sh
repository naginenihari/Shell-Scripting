#!/bin/bash
DISK_USAGE=$(df -hT| grep -v Filesystem)
DISK_THRESHOLD=2 # in project we keep it as 75
IP_ADDRESS=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
MESSAGE=""


while IFS= read -r lines
 do
 USAGE=$(echo $lines |awk '{print $6}'| cut -d '%' -f1)
 PARTITION=$(echo $lines |awk '{print $7}')

    if [ $USAGE -ge $DISK_THRESHOLD ]; then
        MESSAGE+="High Disk usage on $PARTITION: $USAGE %" # escaping
    fi

 done <<< $DISK_USAGE
 
 echo "message body:$MESSAGE"