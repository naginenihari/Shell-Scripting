#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "ERROR:: please run the script with root privelege"
    exit 1
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: installation of MYSQL is failure"
    exit 1
else 
    echo "installation of MYSQL is SUCCESS"
fi   