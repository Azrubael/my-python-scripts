#!/bin/bash

n=1
# while test condition less or equal to 5
while [ $n -le 5 ]; do
	echo "Iteration number $n"
	((n+=1))
done
