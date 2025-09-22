R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[37m"

#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "ERROR:: please run the script with root privelege"
    exit 1  #failure mean other then Zero
fi

VALIDATE() {
if [ $1 -ne 0 ]; then
    echo "ERROR:: installation of $2 is failure"
    exit 1
else 
    echo "installation of $2 is SUCCESS"
fi
 }

dnf install mysql -y
VALIDATE $? "MYSQL"
   
dnf install nginx -y
VALIDATE $? "NGINX"

dnf install python3 -y
VALIDATE $? "PYTHON"
