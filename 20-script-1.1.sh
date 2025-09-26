#!/bin/bash
## Source will access both scripts
NAME=INDIA
echo "my country is: $NAME"
echo "PID of the script-1: $$"

##The script(21) is available in current directory (./)
source ./21-script-2.2.sh