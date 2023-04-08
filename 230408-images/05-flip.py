#!/usr/bin/env python3

"""
Rotates, resizes, and saves
"""

from PIL import Image

im = Image.open("example.jpg")
im.rotate(180).resize((640,480)).save("flipped_and_resized.jpg")