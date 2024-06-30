#!/usr/bin/env bash
# shellcheck shell=bash

: <<'README'
A script that takes a number as a count of needed folders (up to 26) and create these folders in current directory with naming convention `folder_<[a-z]>`.
README


if ! [[ $1 =~ ^[0-9]+$ ]]; then
    echo "Error: Argument must be a non-negative integer."
    exit 1
fi

if (( $1 < 0 || $1 > 26 )); then
    echo "Error: Argument must be in the range from 0 to 26."
    exit 1
fi

alphabet=({a..z})
count=$1

for ((i=0; i<count; i++)); do
    folder_name="folder_${alphabet[i]}"
    mkdir "$folder_name"
    folders+=("$folder_name")
done

if (( count == 1 )); then
    echo "1 folder created: ${folders[0]}"
else
    joined_string=$(printf "%s, " "${folders[@]}")
    output=${joined_string%??}
    echo "$count folders created: ${output}"
fi