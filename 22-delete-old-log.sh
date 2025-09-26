#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[37m"

LOGS_FOLDER="/var/log/shell-scripting"
SCRIPT_NAME=$(echo $0 |cut -d '.' -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script started executed at:$(date)" |tee -a $LOG_FILE

SOURCE_DIR=/home/ec2-user/app_logs

if [ ! -d $SOURCE_DIR ]; then
echo -e "Error :: $SOURCE_DIR does not exist"
exit 1
fi
FILES_TO_DELETE=$(find $SOURCE_DIR -type f -name '*.log' -mtime +14 )

while IFS= read -s filepath

do
 echo "deleting the file $filepath"
 rm -rf $filepath
 echo "deleted the file in $filepath"
done <<< $FILES_TO_DELETE