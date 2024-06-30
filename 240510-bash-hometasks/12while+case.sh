#!/bin/bash


function help {
echo -e "Your possibe options:
\tls [dir] to list the contents of specified directory
\tpwd - to show the path to current directory
\thi - to outputs \"Hello <name of the current user>\" 
\texit - to end the script"
}


regex1='^ls\ .*'
regex2='^dir\ .*'
help

while :
do
    read -p "Enter your command: " usrinput
    if [[ $usrinput =~ $regex1 ]] || [[ $usrinput =~ $regex2 ]]; then
        read -ra args <<< "$usrinput"
        usrinput="ls"
        echo "${args[1]}"
    fi
    case $usrinput in
        "exit")
            exit 0
            ;;
        "pwd")
            echo "$(pwd)"
            ;;
        "hi")
            echo "Hello, $USER!"
            ;;
        "ls")
            echo $usrinput
            if [[ "${args[1]}" = '~' ]]; then
                ls $HOME
            elif [ -d "${args[1]}" ]; then
                ls "${args[1]}"
            else
                echo "${args[1]} is an invalid directory path"
            fi
            ;;
        *)
            echo "-----------------"
            echo -n "Please make Your choise"
            help
            ;;
    esac
done