#! /usr/bin/env python3
"""Simplest PDF generator"""
from reportlab.pdfgen import canvas
c = canvas.Canvas("hello.pdf")
c.drawString(100,750,"Welcome to Reportlab!")
c.save()