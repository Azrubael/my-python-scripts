#!/bin/bash

: <<'TASK'
An algorithm that will identify valid IPv4 addresses in dot-decimal format. IPs should be considered valid if they consist of four octets, with values between 0 and 255, inclusive.
TASK

#!/bin/bash

# Function to check if a given octet is valid (between 0 and 255)
function valid_octet {
    if [[ $1 =~ ^[0-9]+$ && $1 -ge 0 && $1 -le 255 ]]; then
        return 0
    else
        return 1
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

# Main script
while : ; do
    read -r ip
    if valid_ipv4 "$ip"; then
        echo "$ip is a valid IPv4 address."
    elif [[ -z "$ip" ]]; then
        exit 0
    else
        echo "$ip is not a valid IPv4 address."
    fi
done
