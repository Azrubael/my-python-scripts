#!/usr/bin/env python3
"""
Resize an image and save the new image with a new name
"""

from PIL import Image

im = Image.open("example.jpg")
new_im = im.resize((640,480))
new_im.save("example_resized.jpg")
