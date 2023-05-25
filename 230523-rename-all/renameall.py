#!/usr/bin/env python

import subprocess
from multiprocessing import Pool
import os
import sys
import shutil

src = "/data/"
dest = "/updated/"
prefix = "[InfoBank.me] " 


def tasks_creator():
    """This function prepare a list with paths and source filenames"""
    tasks = []
    for dirpath, dirnames, filenames in os.walk("."+src):
        fullpath = os.path.abspath(dirpath)
        # print(fullpath)
        tasks.append([fullpath, filenames])
    return tasks     


def syncronize(path):
    """This function synchronizes the contents of the target folders"""
    oldpath = path[0] + "/"
    newpath = oldpath.replace(src, dest)
    print("Handling {} \nand\t {}\n".format(oldpath,newpath))
    subprocess.call(["rsync", "-zrvh", oldpath, newpath])


def rename(path):
    """This function copy files and directories with changed names"""
    for dir_path in path:
        old_dir = dir_path[0]
        new_dir = old_dir.replace(prefix, "").replace(src, dest)
        old_files = dir_path[1]
        for old_file in old_files:
            src_file = os.path.join(old_dir, old_file)
            filename, extension = os.path.splitext(old_file)
            new_file = filename.replace(prefix, '') + extension
            destination = os.path.join(new_dir, new_file)
            if not os.path.exists(new_dir):
                os.mkdir(new_dir)
            if os.path.exists(destination):
                continue
            shutil.copy2(src_file, destination)
            print("Save {} \nfile in a folder\n{}".format(src_file, destination))
    return


if len(sys.argv) > 1 and sys.argv[1] == 's':
    tasks = tasks_creator()
    p = Pool(len(tasks))
    p.map(syncronize, tasks)
elif len(sys.argv) > 1 and sys.argv[1] == 'r':
    tasks = tasks_creator()
    print(tasks)
    rename(tasks)
else:
        print("""Please select a correct option:
    s - sincronize folders 'data' and 'updated'
    r - copy files with changed named from a folder 'data' in a folder 'updated'""")
