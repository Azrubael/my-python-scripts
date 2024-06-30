#!/bin/bash


#######################################
# Raises the first argument to the power of the second (a^b)
# Arguments:
#   a number, a power.
# Returns:
#   Calculation result.
#######################################
function pow {
    result=1
    for ((i=1; i<=$2; i++)); do
        result=$((result * $1))
    done
    echo $result
}



#######################################
# Finds the shortest string argument.
# If there are more than two arguments, output each string on a new line.
# Arguments:
#   An unlimited list of string arguments
# Returns:
#   Shortest arguments in an order they are passed to function.
#######################################
shortest() {
    shortest_length=${#1}
    for word in "$@"; do
        if [ ${#word} -lt "$shortest_length" ]; then
            shortest_length=${#word}
        fi
    done

    for word in "$@"; do
        if [ ${#word} -eq "$shortest_length" ]; then
            echo "$word"
        fi
    done
}


#######################################
# Takes a string as an argument and outputs
# the same string with the date at the beginning
#######################################
print_log() {
    current_date=$(date +"%Y-%m-%d %H:%M")
    echo "[$current_date] $1"
}
