#!/bin/bash

total_duration=720
interval=10

# Loop for the total duration
for (( elapsed=0; elapsed<total_duration; elapsed+=interval )); do
    echo -n "."
    sleep $interval
done

echo ""