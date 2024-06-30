#!/usr/bin/env bash
# shellcheck shell=bash

: <<'README'
A program that will output the sum of even numbers in a list that is passed to the script.
README


input="$1"
sum=0

if [ -n "$input" ]; then
    IFS=',' read -ra numbers <<< "$input"

    # Loop through the numbers, replace non-numeric values with 0, and calculate the sum of even numbers
    for number in "${numbers[@]}"; do
        if [[ $number =~ ^[0-9]+$ ]]; then
            if (( "$number" % 2 == 0 )); then
                sum=$((sum + number))
            fi
        else
            sum=$((sum + 0))
        fi
    done
fi

echo $sum
