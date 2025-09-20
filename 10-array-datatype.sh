#!/bin/bash

# everything in shell is considerd as string
LEADERS=("LOKESH" "CHANDRA" "REVANTH" "PAVAN" "JAGAN")

echo "first leaders is: ${LEADERS[1]}"

echo "All leaders names are: ${LEADERS[@]}"