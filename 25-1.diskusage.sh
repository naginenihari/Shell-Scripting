#!/bin/bash
DISK_THRESHOLD=2
DISK_USAGE=$(df -hT|grep -v Filesystem)
IP_ADDRESS=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)
MESSAGE=""

while IFS= read -r lines
 do
 USAGE=$(echo $lines |awk '{print $6}'| cut -d '%' -f1)
 PARTITION=$(echo $lines |awk '{print $7}')

 if [ $USAGE -gt $DISK_THRESHOLD ]; then
  MESSAGE+= "High usage on $PARTITION :$USAGE"
 fi

 done <<< $DISK_USAGE

  echo "message body:$MESSAGE"