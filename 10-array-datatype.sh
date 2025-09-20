#!/bin/bash

# everything in shell is considerd as string
LEADERS=("LOKESH" "CHANDRA" "PAVAN" "JAGAN")

echo "first leaders is: ${LEADERS[0]}"

echo "All leaders names are:${LEADERS[@]}"