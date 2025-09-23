#/bin/bash

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

if [ $USERID -ne 0 ]; then
    echo "ERROR:: please run the script with root privelege" |tee -a $LOG_FILE
    exit 1  #failure mean other then Zero
fi
VALIDATE() {
if [ $1 -ne 0 ]; then
    echo -e "installation of $2 is $R FAILURE $N" |tee -a $LOG_FILE
    exit 1
else 
    echo -e "installation of $2 is $G SUCCESS $N" |tee -a $LOG_FILE
fi
}
for package in $@
do
    if [ @? -ne 0 ]; then
        dnf install $package -y &>>F$LOG_FILE
    else
        echo -e " $package already installed--$Y SKIPPING $N"
    fi
done