#!/bin/bash

# Check if the file path is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <file>"
    exit 1
fi

file="$1"

# Check if the file exists
if [ ! -f "$file" ]; then
    echo "File $file not found."
    touch $file
    echo "File $file is created."
else
    echo "File $file already exists."
fi

# Make the file immutable
sudo chattr +i "$file"

lsattr $file
echo "File $file is now immutable."