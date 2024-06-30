#!/usr/bin/env bash
# shellcheck shell=bash

source ./az-functions.sh

pow_check1=$(pow 2 3)
pow_check2=$(pow 2 5)
echo "2^3 = $pow_check1"
echo "2^5 = $pow_check2"
echo ""

shortest_check1=$(shortest "This" "is" "Bash" "Functions" "Task")
shortest_check2=$(shortest "Java" "Bash" "Python")
echo "$shortest_check1"
echo "$shortest_check2"
echo ""

print_log "Hello World!"
print_log "Hello Bash!"