#!/bin/bash

echo "All Variables passed to the script: $1,$2,$3"
echo "Display the script name: $0"
echo "Present working directory: $PWD"
echo "Current user name: $USER"
echo "Current user home directory: $HOME"
echo "PID of current script: $$"
sleep 50 &
echo "PID of backend proccess: $!"
echo "Exit status of the last executed command: $?"