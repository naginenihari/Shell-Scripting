#!/bin/bash

count=10
while [ $count -le 550 ]
do
  echo "Current count: $count"
  count=$((count + 10)) # Increment the counter
done

echo "Loop finished."