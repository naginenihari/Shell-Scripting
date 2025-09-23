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
    echo -e "installation of $2 is $R FAILURE $N"
    exit 1
else 
    echo -e "installation of $2 is $G SUCCESS $N"
fi
 }
 dnf list installed mysql 
#Install if it is not found 
 if [ $? -ne 0 ]; then
    dnf install mysql -y

    VALIDATE $? "MYSQL"
 else
    echo -e MYSQL already exist $Y SKIPPING $N
 fi

 dnf list installed nginx
 if [ $? -ne 0 ]; then 
    dnf install nginx -y
    VALIDATE $? "NGINX"
else
    echo -e NGINX already exist $Y SKIPPING $N
 fi

 dnf list installed python3
 if [ $? -ne 0 ]; then 
    dnf install python3 -y
    VALIDATE $? "PYTHON"
 else
    echo -e PYTHON already exist $Y SKIPPING $N
 fi
