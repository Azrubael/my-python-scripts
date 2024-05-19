#!/bin/bash

: <<'TASK'
In John's car the GPS records every s seconds the distance travelled from an origin (distances are measured in an arbitrary but consistent unit). For example, below is part of a record with s = 15:
    x = [0.0, 0.19, 0.5, 0.75, 1.0, 1.25, 1.5, 1.75, 2.0, 2.25]

The sections are:
    0.0-0.19, 0.19-0.5, 0.5-0.75, 0.75-1.0, 1.0-1.25, 1.25-1.50, 1.5-1.75, 1.75-2.0, 2.0-2.25

We can calculate John's average hourly speed on every section and we get:
    [45.6, 74.4, 60.0, 60.0, 60.0, 60.0, 60.0, 60.0, 60.0]

Given s and x the task is to return as an integer the *floor* of the maximum average speed per hour obtained on the sections of x. If x length is less than or equal to 1 return 0 since the car didn't move.

**Example:**
With the above data your function gps(s, x) should return 74
Note

With floats it can happen that results depends on the operations order. To calculate hourly speed you can use:
    (3600 * delta_distance) / s.
TASK


gps() {
    local s=$1
    shift
    local array=("$@")
    local length=${#array[@]}
    if [[ length -eq 1 ]]
        then
        echo 0
        return 1
    else length=$((${#array[@]}-2))
    fi
    local max_avg_speed
    for ((i=0;i<length;i++)); do
        avg_speed=$(awk -v e="${array[i+1]}" -v b="${array[i]}" -v t="$s" 'BEGIN { printf "%d\n", (3600*(e-b))/t }')
        if [[ $avg_speed -gt $max_avg_speed ]]
            then max_avg_speed=$avg_speed
        fi
    done
    echo "$max_avg_speed"
    return 0
}

# $1 - seconds
# $2 - array
# gps $1 "$2"


x1=(0.0 0.23 0.46 0.69 0.92 1.15 1.38 1.61)
s1=20

x2=(0.0 0.11 0.22 0.33 0.44 0.65 1.08 1.26 1.68 1.89 2.1 2.31 2.52 3.25)
s2=12

x3=(0.0)
s3=19

gps $s1 "${x1[@]}"
gps $s2 "${x2[@]}"
gps $s3 "${x3[@]}"
