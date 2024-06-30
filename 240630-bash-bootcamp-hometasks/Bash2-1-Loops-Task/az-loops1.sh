#!/usr/bin/env bash
# shellcheck shell=bash

: <<'README'
A script that takes a string as an argument and returns its reverse version, changing uppercase letters to lowercase and back.
README

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
    else
        char=""
    fi
    reverse="$reverse$char"
done

echo "$reverse"
