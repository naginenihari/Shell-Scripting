#!/bin/bash

count=1
while [ $count -le 5 ]
do
  echo "Current count: $count"
  count=$((count + 1)) # Increment the counter
done

echo "Loop finished."