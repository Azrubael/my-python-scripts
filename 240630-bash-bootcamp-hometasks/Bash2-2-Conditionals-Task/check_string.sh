#!/bin/bash

# Place your code here
if [ -z "$1" ]; then
    echo "Please provide a string as an argument."
    exit 1
fi

letters=0
numbers=0
symbols=0

# Remove whitespaces from the input string
input=$(echo "$1" | tr -d ' ')

# Loop through each character in the input string
for (( i=0; i<${#input}; i++ )); do
    char=${input:$i:1}
    case $char in
        [a-zA-Z]) ((letters++)) ;;
        [0-9]) ((numbers++)) ;;
        [\*\!\@\#\$\%\^\&\(\)_\+]) ((symbols++)) ;;
    esac
done

# Output the counts
echo "Numbers: $numbers Symbols: $symbols Letters: $letters"