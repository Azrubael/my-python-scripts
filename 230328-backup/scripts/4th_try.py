#!/usr/bin/env python

import subprocess
from multiprocessing import Pool
import os

src = "/data/prod/"
dest = "/data/prod_backup/"

def copy(path):
    oldpath = path + "/"
    newpath = oldpath.replace(src, dest)
    # print("Handling {} \nand\t {}\n".format(oldpath,newpath))
    subprocess.call(["rsync", "-zrvh", oldpath, newpath])
    
tasks = []
for root, dirs, files in os.walk("."+src):
    fullpath = os.path.abspath(root)
    # print(fullpath)
    tasks.append(fullpath)

# print(len(tasks))

p = Pool(len(tasks))
p.map(copy, tasks)

