#!/usr/bin/env python3
"""
A simple script for calculate body mass index.
It is an ideal example of quickly building interactive applications that don’t require a complicated user interface
"""

import pywebio    # https://pywebio.readthedocs.io/en/latest/
from pywebio.input import input, FLOAT
from pywebio.output import put_text

def body_mass_idx():
    height = input("Please input your height(in cm):", type=FLOAT)
    weight = input("Please input your weight(in kg):", type=FLOAT)
    BodyMassIdx = weight / (height / 100) ** 2
    top_status = [
        (16, 'Severely underweight'),
        (18.5, 'Underweight'),
        (25, 'Normal'),
        (30, 'Overweight'),
        (35, 'Moderately obese'),
        (float('inf'), 'Severely obese'),
        ]
    
    for top, status in top_status:
        if BodyMassIdx <= top:
            put_text('Your body mass index: %.1f. Category: %s' % (BodyMassIdx, status))
            break

if __name__ == '__main__':
    body_mass_idx()
    # pywebio.start_server(body_mass_idx, port=4444)