#!/bin/bash

: <<'TASK'
Messi is a soccer player with goals in three leagues:
    LaLiga
    Copa del Rey
    Champions

Complete the function to return his total number of goals in all three leagues.
Note: the input will always be valid.
For example:
5, 10, 2  -->  17
TASK

echo $(( $1 + $2 + $3 ))
echo "$1+$2+$3" | bc