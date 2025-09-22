#!/bin/bash

# -lt --less than
# -gt -- greater than
# -eq --equal
# -ne --not equal

NUMBER=$1

if [ $NUMBER -lt 10 ]; then
    echo "given number $NUMBER is less then to 10"
else 
    echo "given number $NUMBER is grater than to 10"
fi