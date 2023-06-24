#!/usr/bin/env  python

""" Bulk file renaming """

import shutil
from shutil import copy
import os
import sys
 
source = "./data/"

if not os.path.exists(source):
    print("A source directory", source, "don't exists")
    sys.exit(0)

counter = 0

for directory, subdirs, files in os.walk(source):
    for file in files:
        dst_filename = file.replace(' - ', '-')
        if file == dst_filename:
            continue
        src_file = os.path.join(directory, file)
        dst_file = os.path.join(directory, dst_filename)
        # shutil.copy2(src_file, dst_file)
        shutil.move(src_file, dst_file, copy_function=copy)
        counter += 1

print("Done!", counter, "files renamed.")