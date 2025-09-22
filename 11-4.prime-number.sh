#!/bin/bash

read -p "Enter a number: " NUMBER

# 0 and 1 are not prime
if [ "$NUMBER" -le 1 ]; then
  echo "$NUMBER is not a prime number"
  exit 0
fi

# 2 and 3 are prime
if [ "$NUMBER" -le 3 ]; then
  echo "$NUMBER is a prime number"
  exit 0
fi

# If divisible by 2, not prime
if [ $((NUMBER % 2)) -eq 0 ]; then
  echo "$NUMBER is not a prime number"
  exit 0
fi

# Calculate integer square root (truncate decimal)
limit=$(echo "scale=0; sqrt($NUMBER)/1" | bc)

i=3
while [ $i -le "$limit" ]
do
  if [ $((NUMBER % i)) -eq 0 ]; then
    echo "$NUMBER is not a prime number"
    exit 0
  fi
  i=$((i+2))
done

echo "$NUMBER is a prime number"
