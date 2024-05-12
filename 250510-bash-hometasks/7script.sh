#!/bin/bash

# 1]
[[ $1 == $2 ]]
echo -e "Exit code of $1 == $2 is:\n $?"

# 2]
[ ${#1} -gt ${#2} ]
echo -e "Exit code from the operation of comparing the lengths of the first and second arguments:\n $?"

# 3]
[ -n "$TEST" ]
echo -e "Exit code from the check test of TEST variable:\n $?"

# 3a - проверка наличия третьего и четвертого агрументов, а также являются ли они целыми числами
if [ -z "$3" ] || [ -z "$4" ]; then
    echo "The fourth argument don't exist"
    exit 1
elif ! [[ $3 =~ ^[0-9]*$ ]]; then
    echo "The third argument isn't integer"
    exit 2
elif ! [[ $4 =~ ^[0-9]*$ ]]; then
    echo "The fourth argument isn't integer"
    exit 3
else
    echo "The both third and fourth arguments are integers."
fi

# 4]
[ $3 -ne $4 ]
echo -e "Exit code from checking for equality of the third and fourth arguments: \n $?"

# 5]
[ "$3" -ge $4 ]
echo -e "exit code for checking whether the third argument is greater than or equal to the fourth:\n $?"
