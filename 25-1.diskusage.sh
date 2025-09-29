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
 
sh mail.sh "info@joindevops.com" "High Disk Usage Alert" "High Disk Usage" "$MESSAGE" "$IP_ADDRESS" "DevOps Team"

# TO_ADDRESS=$1
# SUBJECT=$2
# ALERT_TYPE=$3
# MESSAGE_BODY=$4
# IP_ADDRESS=$5