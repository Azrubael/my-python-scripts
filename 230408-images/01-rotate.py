#!/usr/bin/env python3
"""
The following script loads an image, rotates it 45 degrees, and displays it using an external viewer 
"""

from PIL import Image
with Image.open("example.jpg") as im:
    im.rotate(45).show()