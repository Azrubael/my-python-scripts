# 2024-02-28    15:54
=====================


# Goals:
- learn to use case statement


# Tasks:
- create a script called `my_service.sh` which does the following:
    accepts start, stop, restart arguments:
        start - outputs "Service started" message and sleeps for 9999
        stop - gets the PID of `my_service.sh` process and terminates it, then outputs "Service stopped" message
        restart - stops and then starts the service
    any other argument outputs script usage information

- add your service to PATH
- run your script with start and restart arguments in background
- run your script with stop and help arguments


# Self-check:

- script executions retrun the following:
start:
[1] 45043
Service is started
stop:
Service is stopped
[2]  + 44996 terminated  ./my_script.sh start
restart:
[1] 45863
Service is stopped
Service is started
help:
usage: my_service.sh [start|stop|restart]

Helpful materials:
https://linuxize.com/post/bash-case-statement/
https://devhints.io/bash

