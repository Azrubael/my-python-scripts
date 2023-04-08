#!/usr/bin/env python3

import sys
import os

file = open(sys.argv[1], 'r')
oldText = file.read()
newText = oldText.replace('\n', ' ')
newText = newText.replace('\r', ' ')
newText = newText.replace('##', '\n')
file.close()

print(newText)

file = open(sys.argv[1], 'a')
file.write('\n'+"="*39 + '\n')
file.write(newText)
file.close()
	
print("Ok")