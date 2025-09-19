#!/bin/bash

START_DATE=$(date +%s)

sleep 10

END_DATE=$(date +%s)

TOTAL_TIME=$(($START_DATE-$END_DATE))

echo "Script execution total time is ":$TOTAL_TIME