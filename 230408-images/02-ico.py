#!/usr/bin/env python3

"""
The following script creates nice thumbnails of all JPEG images in the current directory preserving aspect ratios with 128x128 max resolution.
"""

from PIL import Image
import glob, os

size = 128, 128

for infile in glob.glob("*.jpg"):
    file, ext = os.path.splitext(infile)
    with Image.open(infile) as im:
        im.thumbnail(size)
        im.save(file + ".ico", "JPEG")