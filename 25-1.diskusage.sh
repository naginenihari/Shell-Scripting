#!/bin/bash
DISK_THRESHOLD=2 # in project we keep it as 75
DISK_USAGE=$(df -hT| grep -v Filesystem)
IP_ADDRESS=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
MESSAGE=""


while IFS= read -r lines
 do
 USAGE=$(echo $lines |awk '{print $6}'| cut -d '%' -f1)
 PARTITION=$(echo $lines |awk '{print $7}')

 if [ $USAGE -ge "$DISK_THRESHOLD" ]; then
  MESSAGE+= "High usage on $PARTITION :$USAGE%"
 fi

 done <<< $DISK_USAGE