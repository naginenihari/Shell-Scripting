#!/bin/bash

DISK_USAGE=$(df -hT|grep -v filesystem|awk '{print$6}'|cut -d '%' -f1)

while IFS= read -r lines
 do

echo "line $lines"

 done <<< $DISK_USAGE