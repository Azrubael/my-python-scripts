#!/bin/bash

# To list all files in the current directory
ls -lha | grep "^-" 

# To check permissions of a file '8-workflow.md'
stat -c "%a %n" 8-workflow.md
