#!/usr/bin/env python3

from PIL import Image
import glob, os

size = 128, 128
src = os.path.join(os.path.dirname(__file__), "images/")
dest = "/opt/icons/"

print('Saved new files:')
for in_file in glob.glob(src + "*"):
    new_file = in_file.replace(src, dest)
    print(new_file)
    file, ext = os.path.splitext(new_file)
    with Image.open(in_file) as im:
        im.rotate(90).resize(size).convert('RGB').save(file, "jpeg")