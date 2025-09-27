#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[37m"
#OURCE_DIR=
#DEST_DIR=

LOGS_FOLDER="/var/log/shell-scripting"
SCRIPT_NAME=$(echo $0 |cut -d '.' -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script started executed at:$(date)" |tee -a $LOG_FILE

#Checking user is root user or not
if [ $USERID -ne 0 ]; then
echo "ERROR :: please run this scripts with root privelege"
exit 1
fi

USAGE(){
    echo "USAGE:: sh 24-backup.sh <SOURCE_DIR> <DEST_DIR> <NO_DAYS>"
    exit 1
}
if [ $# -le 2]; then
USAGE
fi

#SOURCE_DIR=$1
#DEST_DIR=$2
