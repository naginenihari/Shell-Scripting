#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "ERROR:: please run the script with root privelege"
    exit 1  #failure mean other then Zero
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: installation of MYSQL is failure"
    exit 1
else 
    echo "installation of MYSQL is SUCCESS"
fi   

dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "ERROR:: installation of nginx is failure"
    exit 1
else 
    echo "installation of nginx is SUCCESS"
fi 

dnf install python3 -y

if [ $? -ne 0 ]; then
    echo "ERROR:: installation of python is failure"
    exit 1
else 
    echo "installation of python is SUCCESS"
fi 