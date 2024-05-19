# shellcheck shell=bash
# calculate the sum of a set of numbers 

n=$1
i=1
sum=$i
str="$i"

until [[ $i -ge $n ]]; do
    (( i++ ))
    sum=$(( sum + i ))
    str="$str + $i"  
done

printf "%d -> %d (%s)\n" "$n" "$sum" "$str"