#!/bin/bash

### Function to wait for a key press
wait_for_key_press() {
    read -n 1 -s -t $1 key
    if [[ $key == "q" ]]; then
        return 0  # Space bar pressed
    fi
    sleep $interval
    return 1  # No key pressed
}

total_duration=720
interval=15
elapsed=0

# Main waiting loop
while [ $elapsed -lt $total_duration ]; do
    echo -n "${elapsed}s "
    elapsed=$((elapsed + interval))
    if wait_for_key_press $interval; then
        echo -e "\nInterrupted by user."
        break
    fi
done
echo ""