#!/bin/bash

ARGS=$@
SUM=0
number=0

for el in ${ARGS[@]}; do
  if [[ $el =~ ^[0-9]+$ ]]; then
    SUM=$(($SUM + $el))
    ((number++))
  else
    echo -e  "  The argument $el isn't an integer.\n\tSo it's taken into account as a ZERO!"
  fi
done

echo "The total number of arguments is: $#"
echo "The number of integers is: $number"
echo "The result of adding array elements is: $SUM" 
echo "The average is $(($SUM/$#))"