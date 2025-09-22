#!/bin/bash

# -lt --less than
# -gt -- greater than
# -eq --equal
# -ne --not equal

NUMBER=$1

if 
    [ $NUMBER -lt 10 ];

echo "given number $NUMBER is less then 10"

else 
    echo "given number $NUMBER is grater than 10"
fi