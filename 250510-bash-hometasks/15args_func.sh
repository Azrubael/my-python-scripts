#!/bin/bash


if [[ $# -eq 0 ]]; then
    echo "This script accepts a few integer arguments"
    exit 1
fi

args=($@)
regex='^[0-9]+$'
q_ty=${#args[@]}
(( q_ty-=1 ))
i=0
result=""


function concat {
    echo "Arg$(( $3 + 1 )): $1"
    if [[ $1 =~ $regex ]]
        then result="$result $(( $1 + $2 ))"
        else result="$result $1"
    fi
}


until [ $i -ge $q_ty ]; do
    next=$(($i + 1))
    concat "${args[i]}" "${args[next]}" "$next"
    (( i++ ))
done

concat "${args[i]}" "${args[0]}" "$i"
echo $result


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