"""
A script that searches for the most frequently occurring word in a text file
With time check.
"""

import os
import string
import time

name = input('Enter the taret filename in current directory: ')
pwd = os.getcwd()
full_path = pwd + '/' + name 

start_time = time.time()
if os.path.exists(full_path):
    print('The path to the target file', full_path)

try:
    handle = open(full_path, 'r')
except:
    print('File reading error for ', full_path)
    os._exit(os.EX_OK)

counts = dict()
for line in handle:
    slicing = line.split()
    words = []
    for str in slicing:
        word = "".join(char for char in str if char not in string.punctuation)
        words.append(word)
    for word in words:
        counts[word] = counts.get(word,0) + 1

bigcount = 1
bigword = None
for word,count in counts.items():
    if count > bigcount:
        bigword = word
        bigcount = count
    elif count == bigcount:
        bigword = bigword + " " + word

end_time = time.time()
print(bigword, bigcount)
print(counts)
print(f"Time spent {end_time - start_time} seconds")
