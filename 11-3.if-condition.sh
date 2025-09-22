#!/bin/bash
    NUMBER=$1
    read NUMBER
if [ $(($NUMBER % 2)) -eq 0 ]; then
    echo "given number $NUMBER is EVEN"
else
    echo "given number $NUMBER is ODD"
fi