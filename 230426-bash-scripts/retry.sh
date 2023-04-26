#!/bin/bash

n=0
command=$1  # here we take access to 1st command line argument
while ! $command && [ $n -le 5 ]; do
	sleep $n  # here the program sleeps a few seconds
	((n=n+1)) # increment
	echo "Retry #$n"
done;

