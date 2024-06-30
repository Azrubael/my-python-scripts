#!/bin/bash

ARGS=($@)
str=""

for ((i=0;i<$#;i++)); do
  echo "Arg$i: ${ARGS[i]}"
  if [[ $i -lt $(($#-1)) ]]; then
    str="$str $((${ARGS[i]} + ${ARGS[i+1]}))"
  else
    str="$str $((${ARGS[0]} + ${ARGS[i]}))"
  fi
done

echo $str

: <<'EXAMPLE'
$ ./14args_240512.sh 7 1 5 7 4 3 6
Arg0: 7
Arg1: 1
Arg2: 5
Arg3: 7
Arg4: 4
Arg5: 3
Arg6: 6
8 6 12 11 7 9 13
EXAMPLE