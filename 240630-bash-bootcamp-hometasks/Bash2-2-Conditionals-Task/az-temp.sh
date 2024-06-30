#!/usr/bin/env bash
# shellcheck shell=bash

: <<'README'
A script that takes the temperature value in Celsius OR Kelvins and returns the converted value.
README


# Check if the input is provided
if [ -z "$1" ]; then
    echo "Please provide a temperature value in Celsius or Kelvins as an argument."
    exit 1
fi

# Get the temperature value and unit
temp=${1%?}
unit=${1: -1}

# Check if the unit is either C or K
if [ "$unit" != "C" ] && [ "$unit" != "K" ]; then
    echo "Invalid unit of measurement. Please use either C or K."
    exit 1
fi

# Check if the temperature value is an integer
if ! [[ $temp =~ ^-?[0-9]+$ ]]; then
    echo "Temperature value must be an integer without spaces."
    exit 1
fi

# Check if the temperature is negative for Kelvin degrees
if [ "$unit" == "K" ] && [ "$temp" -lt 0 ]; then
    echo "Temperature value cannot be negative for Kelvin degrees."
    exit 1
fi

# Calculate the inverse value
if [ "$unit" == "C" ]; then
    inverse=$((temp + 273))
    echo "Converted value is: $inverse K"
else
    inverse=$((temp - 273))
    echo "Converted value is: $inverse C"
fi
