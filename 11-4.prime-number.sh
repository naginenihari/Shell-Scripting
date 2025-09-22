#!/bin/bash

read -p "Enter a number: " num
if [ "$NUMBER" -le 1 ]; then
  echo "$NUMBER is not a prime number"
  exit 0
fi

if [ ("$NUMBER") -le 3 ]; then
  echo "$NUMBER is a prime number"
  exit 0
fi
if [ $(($NUMBER % 2)) -eq 0 ]; then
  echo "$NUMBER is not a prime number"
  exit 0
fi
limit=$(echo "sqrt($NUMBER)" | bc)
i=3
while [ $i -le "$limit" ]
do
  if [ $(($NUMBER % i)) -eq 0 ]; then
    echo "$NUMBER is not a prime number"
    exit 0
  fi
  i=$((i+2))
done
echo "$NUMBER is a prime number"
