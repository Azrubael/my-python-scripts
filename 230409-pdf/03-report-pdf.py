#! /usr/bin/env python3
"""First iteration of a PDF report"""

from reportlab.platypus import Paragraph, Spacer, Table, Image
from reportlab.platypus import SimpleDocTemplate
from reportlab.lib.styles import getSampleStyleSheet

report = SimpleDocTemplate("report.pdf")
styles = getSampleStyleSheet()
report_title = Paragraph("A Complete Inventory of My Fruit", styles["h1"])

report.build([report_title])
report.save()