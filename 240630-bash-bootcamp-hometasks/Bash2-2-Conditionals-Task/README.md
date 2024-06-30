# DevOps BootCamp: Bash Conditionals

>Please use branch ```task_cond``` for this task that already exist in your forked repository after you has been started task

## Task 1
An unsorted list is passed to the script. Write a program that will output the sum of even numbers

### Check
`./cond1.sh "1,2,3,4,5,6,7"`

12

`./cond1.sh "4,3,1"`

4

`./cond1.sh "2,2,9,3,8"`

12

`./cond1.sh ""`

0

## Task 2
Develop a script that takes the temperature value in Celsius OR Kelvins and returns the inverse value.
The formula is pretty simple: `C = K - 273`; `K = C + 273`

### Check

`./temp.sh 55C`

328K

`./temp.sh 122K`

-151C

`./temp.sh 98C`

371K


## Task 3
Develop script that takes any string and calculate count of letters, numbers, symbols `*!@#$%^&()_+` inside except whitespaces

### Check

`./check_string.sh "Hello ! ** 564gfhf"`

Numbers: 3 Symbols: 3 Letters: 9

`./check_string.sh "Hello !   +"`

Numbers: 0 Symbols: 2 Letters: 5

`./check_string.sh "Hello !!"`

Numbers: 0 Symbols: 2 Letters: 5
