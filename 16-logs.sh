#/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[37m"

LOGS_FOLDER="/var/log/shell-scripting"
SCRIPT_NAME=$(echo $0 |cut -d '.' -f1)
LOG_FILE-"$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script started executed at:$(date)"

if [ $USERID -ne 0 ]; then
    echo "ERROR:: please run the script with root privelege"
    exit 1  #failure mean other then Zero
fi

VALIDATE() {
if [ $1 -ne 0 ]; then
    echo -e "installation of $2 is $R FAILURE $N"
    exit 1
else 
    echo -e "installation of $2 is $G SUCCESS $N"
fi
 }
 dnf list installed mysql &>>$LOG_FILE
#Install if it is not found 
 if [ $? -ne 0 ]; then
    dnf install mysql -y &>>$LOG_FILE

    VALIDATE $? "MYSQL"  
 else
    echo -e MYSQL already exist $Y SKIPPING $N
 fi

 dnf list installed nginx &>>$LOG_FILE
 if [ $? -ne 0 ]; then 
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "NGINX"
else
    echo -e NGINX already exist $Y SKIPPING $N
 fi

 dnf list installed python3 &>>$LOG_FILE
 if [ $? -ne 0 ]; then 
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "PYTHON"
 else
    echo -e PYTHON already exist $Y SKIPPING $N
 fi