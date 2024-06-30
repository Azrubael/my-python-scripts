#!/bin/bash

: <<'TASK'
This program tests the life of an evaporator containing a gas.
    We know the content of the evaporator (content in ml), the percentage of foam or gas lost every day (evap_per_day) and the threshold (threshold) in percentage beyond which the evaporator is no longer useful. All numbers are strictly positive.
The program reports the Nth day (as an integer) on which the evaporator will be out of use.
Example:        evaporator(10, 10, 5) -> 29

TASK


evaporator () {
    local Nth=0
    local vol
    vol=$(echo "$1*100000" | bc)
    local evap_daily=$2
    local threshold
    threshold=$(echo "scale=2; $vol*$3/100" | bc)
    while [[ $(echo "$vol >= $threshold" | bc) != 0 ]];do
        vol=$(echo "$vol-($vol*$evap_daily/100)" | bc)
        ((  Nth++ ))
    done
    echo $Nth
}

evaporator2 () {
    local Nth=0
    v=$(echo "$1" | bc -l)
    t=$(echo "$v * $3 / 100" | bc -l)
    
    while (( $(echo "$v >= $t" | bc -l) )); do
        ((Nth++))
        v=$(echo "$v - ($v * $2 / 100)" | bc -l)
    done
    echo $Nth
}

evaporator3 () {
    local Nth
    local d=$2
    local m
    m=$(echo "$1*$3/100" | bc -l)
    Nth=$(awk -v v="$1" -v e="$d" -v t="$m" 'BEGIN { printf "%d\n", log(t/v)/log(1-e/100) + 1 }')
    echo "$Nth"
}

evaporator_optimized() {
  res=$(bc -l <<< "l($3/100)/l(1-$2/100)")
  bc <<< "$res-$res%1+1"
}

evaporator "$1" "$2" "$3"

evaporator2 "$1" "$2" "$3"

evaporator3 "$1" "$2" "$3" # the wrong

evaporator_optimized "$1" "$2" "$3"