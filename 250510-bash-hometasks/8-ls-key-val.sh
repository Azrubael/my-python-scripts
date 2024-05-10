#!/bin/bash

# Initialize an empty array to store key-value pairs
declare -A file_info

# Loop through each file in the current directory
for file in *; do
    # Check if the file is a regular file
    if [ -f "$file" ]; then
        # Get the size of the file in bytes
        size=$(stat -c %s "$file")
        # Add key-value pair to the array
        file_info["$file"]=$size
    fi
done

# Print the key-value pairs (file names and sizes)
for key in "${!file_info[@]}"; do
    echo "File: $key, Size: ${file_info[$key]} bytes"
done


# $ ./8-key-val_240510.sh
# File: 8-permissions-task.md, Size: 1385 bytes
# File: 8-permissions-homework_240510.sh, Size: 104 bytes
# File: 8-key-val_240510.sh, Size: 536 bytes
# File: 8-workflow.md, Size: 6146 bytes
