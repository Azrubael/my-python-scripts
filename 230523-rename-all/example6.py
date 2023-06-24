#!//usr/bin/env python
import shutil
import os
 
source = "./data/"
destination = "./updated/"

"""
Bulk file renaming with the addition of a three-digit index at the end of each name
"""

for directory, subdirs, files in os.walk(source):
    # directory will capture the source directory and all other folders inside it
    print("Directory:", directory)
    # dest_dir will replace the source path with the destination directory
    # This gets us the directories we need to create in the destination
    dest_dir = directory.replace(source, destination)
    # if dest_dir, a destination directory corresponding to the directory
    # in the source doesn't exist; create it.
    # os.makedirs() allows us to create nested directories
    # for example os.makedirs("dir1/dir2/dir3") will create three directories
    # dir3 inside dir2 which is inside dir1.
    # os.makedirs() is available in Python 3.2 and later versions.
    if not os.path.exists(dest_dir):
        os.makedirs(dest_dir)
    # Loop through all files in all directories in the source.
    # Enumerate allows us to get the index for each file.
    # enumerate(files, 1) means start enumerate at index 1, not the default 0.
    for index, file in enumerate(files, 1):
        # Get the index and turn it into a three-digit string using zfill().
        # For example, 1 becomes 001, 2 becomes 002, 3 becomes 003 etc.
        three_digit_index = str(index).zfill(3)
        # Get the source file by joining the source folder with filename
        source_file = os.path.join(directory, file)
        # Get the basename and extension separated. e.g., test1.json becomes
        # ("test1", "".json")
        filename, extension = os.path.splitext(file)
        # Create a new filename with numbered files using the indices.
        new_file = f"{filename}_{three_digit_index}{extension}"
        # Join the destination directory we created earlier with the new filename
        destination1 = os.path.join(dest_dir, new_file)
        # If the destination file already exists, skip it.
        if os.path.exists(destination1):
            continue
        # Copy the file to the destination directory.
        shutil.copy2(source_file, destination1)