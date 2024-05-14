#!/bin/bash

# A script than accepts a few integer parameters,
# multiplies them one by one
# and increments in displays them one by one

if [[ $# -eq 0 ]]; then
    echo "This script accepts at least one integer argument"
    exit 1
fi

args=($@)
len=($#)
regex='^[0-9]+$'


function mult {
  echo $(($1*$1))
}


function incr {
  for i in ${args[@]}; do
    if [[ $i =~ $regex ]]
      then res=$(mult $i)
      else res=0
    fi
    (( res++ ))
    echo $res
  done
}


incr