#!/bin/bash

: <<'TASK'
An algorithm that will identify valid IPv4 addresses in dot-decimal format. IPs should be considered valid if they consist of four octets, with values between 0 and 255, inclusive.
TASK

adr="$1"
if echo "$adr" | grep -q '[1-255].[1-255].[1-255].[1-255]'
    then echo "True"
    else echo "False"
fi
