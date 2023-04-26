#!/bin/bash

line="----------------------------------"

echo "Starting at: $(date)"
echo $line
echo "UPTIME is"; uptime -p
echo $line
echo "FREE memory"; free -h
echo $line
echo "WHO is logged"; who
echo $line
echo "Finishing at: $(date)"
echo $line

echo "$PATH:"
echo $line

printenv PATH
echo $line

echo "The environment variables:"
printenv | less # printout environment variables

