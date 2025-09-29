#!/bin/bash
DISK_THRESHOLD=2
DISK_USAGE=$(df -hT|grep -v Filesystem)

while IFS= read -r lines
 do
 USAGE=$(echo $lines |awk '{print$6}'| cut -d '%' -f1)
 PARTITION=$(echo $lines |awk '{print$7}')
 if [$USAGE -gt $DISK_THRESHOLD]
  echo "High usage on $PARTITION :$USAGE"
 fi
 done <<< $DISK_USAGE