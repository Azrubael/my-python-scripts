#!/usr/bin/env python3
# import PIL.Image as Image
from PIL import Image

im = Image.open("vim-vi.png")
resized_im = im.resize((640,480)).save("vim-vi-resized.png")
rotaded_im = im.rotate(90).save("vim-vi-rotated.png")
# im.rotate(45).show()

if not im.mode == 'RGB':
  jpeg_im = im.transpose(method=2).convert('RGB')
else:
  jpeg_im = im.transpose(method=2)
"""
FLIP_LEFT_RIGHT = 0
FLIP_TOP_BOTTOM = 1
ROTATE_180 = 3
ROTATE_270 = 4
ROTATE_90 = 2
TRANSPOSE = 5
TRANSVERSE = 6
"""

jpeg_im.save("new-vim-vi.jpg",format="JPEG")
