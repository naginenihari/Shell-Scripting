#!/bin/bash

count=10
while [ $count -ge 550 ]
do
  echo "Current count: $count"
  count=$((count + 100)) # Increment the counter
done

echo "Loop finished."