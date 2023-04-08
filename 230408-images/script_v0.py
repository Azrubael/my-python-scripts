#!/usr/bin/env python3

"""
Iterate through each file in the folder './images'
For each file: 
    Rotate the image 90° clockwise
    Resize the image from 192x192 to 128x128
    Save the *.tiff image to a new folder in *.jpeg format in folder './icons'
"""

from PIL import Image
import glob, os

size = 128, 128
src = os.path.join(os.path.dirname(__file__), "images/")
dest = os.path.join(os.path.dirname(__file__), "icons/")

for in_file in glob.glob(src + "*.TIFF"):
    print('Saved new files:')
    new_file = in_file.replace(src, dest)
    print(new_file)
    file, ext = os.path.splitext(new_file)
    with Image.open(in_file) as im:
        im.rotate(90).resize(size).save(file + '.jpeg', "jpeg")

    
