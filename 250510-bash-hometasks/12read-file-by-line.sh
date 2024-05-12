#!/bin/bash

file="$HOME/.bashrc"

if [ -f "$file" ]; then
  while IFS= read -r line; do
    echo "$line"
  done < "$file"
else 
  echo "File $file does not exist."
fi