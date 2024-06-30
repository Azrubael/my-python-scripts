#!/bin/bash

# Put your code here
reverse=""
input="$1"

for (( i=${#input}-1; i>=0; i-- )); do
    char="${input:$i:1}"
    if [[ $char =~ [[:alpha:]] ]]; then
        if [[ $char == [[:lower:]] ]]; then
            char=$(echo "$char" | tr '[:lower:]' '[:upper:]')
        elif [[ $char == [[:upper:]] ]]; then
            char=$(echo "$char" | tr '[:upper:]' '[:lower:]')
        fi
    fi
    reverse="$reverse$char"
done

echo "$reverse"