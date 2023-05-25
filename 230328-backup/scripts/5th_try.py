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
for dirpath, dirnames, filenames in os.walk("."+src):
    fullpath = os.path.abspath(dirpath)
    # print(fullpath)
    tasks.append(fullpath)
p = Pool(len(tasks))
p.map(copy, tasks)

