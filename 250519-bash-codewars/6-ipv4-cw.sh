#!/bin/bash

: <<'TASK'
An algorithm that will identify valid IPv4 addresses in dot-decimal format. IPs should be considered valid if they consist of four octets, with values between 0 and 255, inclusive.
TASK

adr="$1"

# Function to check if a given octet is valid (between 0 and 255)
function valid_octet {
    local result=""
    if [[ $1 =~ ^0[0-9]+$ ]]; then
        result="False"
    elif [[ $1 =~ ^[0-9]+$ && $1 -ge 0 && $1 -le 255 ]]; then
        result="True"
    else
        result="False"
    fi

    if [[ $result == "False" ]]; then
        return 1
    else
        return 0
    fi
}

# Function to check if a given IP address is valid
function valid_ipv4 {
    local IFS='.'
    read -r -a octets <<< "$1"
    if [ ${#octets[@]} -ne 4 ]; then
        return 1
    fi

    for octet in "${octets[@]}"; do
        if ! valid_octet "$octet"; then
            return 1
        fi
    done

    return 0
}

if valid_ipv4 "$adr"; then
    echo "True"
else
    echo "False"
fi
