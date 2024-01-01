#!/bin/bash

# Get the link from the first argument
link=$1

# Check if the link is a real file
if [ ! -f "$link" ]; then
  echo "The link is not a valid file."
  exit 1
fi

# Get the file extension
ext=${link##*.}

# Check if the file is an archive
if [ "$ext" == "zip" ] || [ "$ext" == "tar" ]; then
  # Unzip or untar the file in the current directory
  case $ext in
    zip) unzip -o "$link" ;;
    tar) tar -xvf "$link" ;;
  esac
else
  echo "The file is not an archive."
  exit 2
fi

# Create an associative array with file names as keys and values
declare -A files
for f in *; do
  files[$f]=$f
done

# Exclude all the elements that are not mp4 video files
for f in "${!files[@]}"; do
  if [ "${f##*.}" != "mp4" ]; then
    unset files[$f]
  fi
done

# Print the remaining elements of the array
echo "The mp4 video files are:"
for f in "${!files[@]}"; do
  echo "$f"
done