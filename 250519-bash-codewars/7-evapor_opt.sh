#!/bin/bash

: <<'TASK'
This program tests the life of an evaporator containing a gas.
    We know the content of the evaporator (content in ml), the percentage of foam or gas lost every day (evap_per_day) and the threshold (threshold) in percentage beyond which the evaporator is no longer useful. All numbers are strictly positive.
The program reports the Nth day (as an integer) on which the evaporator will be out of use.
Example:        evaporator(10, 10, 5) -> 29

TASK

evaporator2 () {
    local Nth=0
    local v
    v=$(echo "$1" | bc -l)
    local t
    t=$(echo "$v * $3 / 100" | bc -l)
    
    while (( $(echo "$v >= $t" | bc -l) )); do
        ((Nth++))
        v=$(echo "$v - ($v * $2 / 100)" | bc -l)
    done
    echo $Nth
}

evaporator_opt () {
    local Nth
    local d=$2
    local m
    m=$(echo "$1*$3/100" | bc -l)
    Nth=$(awk -v v="$1" -v e="$d" -v t="$m" 'BEGIN { printf "%d\n", log(t/v)/log(1-e/100) + 1 }')
    echo "$Nth"
}


evaporator2 "$1" "$2" "$3"

evaporator_opt "$1" "$2" "$3"