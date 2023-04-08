#!/usr/bin/env python3

"""
Rotate an image on 90*
"""

from PIL import Image
im = Image.open("example.jpg")
new_im = im.rotate(90)
new_im.save("example_rotated.jpg")