#!/bin/bash

ARG=$1
CWD=$(pwd)


function chkpath {
    if [[ ":$PATH:" == *":$CWD:"* ]]; then
        echo "The current directory is already in the PATH"
        if grep -q "export PATH" ~/.bashrc; then
            echo "PATH declaration is already exists in ~/.bashrc"
            return 2
        else
            # echo "~/.bashrc doesn't have PATH declaration"
            return 1
        fi
    else
        echo "The current directory isn't in the PATH"
        return 0
    fi
}


function add2path {
    echo "The current working directory:"
    echo $CWD
    chkpath
    case $? in
        2 | 0)
            sed -i '/export PATH=/d' ~/.bashrc
            new_path=$(echo $PATH | sed "s#:$cwd##g;s#$cwd:##g;s#$cwd##g" | sed 's/^://' | sed 's/:$//')            
            echo "export PATH=$new_path:$CWD" >> ~/.bashrc
            source ~/.bashrc
            echo "The current PATH has been updated right now"
            ;;
        1 )
            echo "The current directory already is in PATH"
            ;;
        * )
            echo "Something went wrong $?"
            ;;
    esac
}


function start {
    echo "Service is started"
    sleep 9999 &
}


function stop {
    # Check if the process is running
    pids=($(pgrep -f "sleep 9999"))
    if [ -n "$pids" ]; then
        # Terminate all the processes
        for proc in "${pids[@]}"; do
            kill $proc
            echo "Service with PID ${proc} stopped"
        done
    else
        echo "Service is not running"
    fi
}


function restart {
    echo "Restarting the script..."
    stop
    start
}


function help {
    echo "Example of using the script:"
    echo "\$ ./my_service9.sh -[s|q|r|a]"
    echo "-s   to start a service"
    echo "-q   to stop a service"
    echo "-r   to restart a service"
    echo "-a   to add a servithe in the PATH"
    echo "anything else - to print out the current message"
}

case $ARG in
    -s) start ;;
    -q) stop ;;
    -r) restart ;;
    -a) add2path ;;
    *)  help ;;
esac

echo ""
