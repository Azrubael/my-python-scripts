#!/bin/bash

echo "You've entered the number $1"

case $1 in
    *[0,2,4,6,8])
        echo "The number is even" ;;
    *[1,3,5,7,9])
        echo "The number is odd" ;;
esac
