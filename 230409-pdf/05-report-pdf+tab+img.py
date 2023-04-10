#! /usr/bin/env python3
"""Third iteration of a PDF report with a table and a pie diagram"""

from reportlab.platypus import Paragraph, Spacer, Table, Image
from reportlab.platypus import SimpleDocTemplate
from reportlab.lib import colors
from reportlab.lib.styles import getSampleStyleSheet
from reportlab.graphics.shapes import Drawing
from reportlab.graphics.charts.piecharts import Pie

fruit = {
  "elderberries": 1,
  "figs": 1,
  "apples": 2,
  "durians": 3,
  "bananas": 5,
  "cherries": 8,
  "grapes": 13
}

report = SimpleDocTemplate("report.pdf")
styles = getSampleStyleSheet()
report_title = Paragraph("A Complete Inventory of My Fruit", styles["h1"])

# Creation of a 2D array
table_data = []
for k, v in fruit.items():
   table_data.append([k, v])
print(table_data)

table_style = [('GRID', (0,0), (-1,-1), 1, colors.black)]
report_table = Table(data=table_data, style=table_style, hAlign="LEFT")

report_pie = Pie()
report_pie.x = 200
report_pie.y = 50
report_pie.width = 200
report_pie.height = 200

report_pie.data = []
report_pie.labels = []
for fruit_name in sorted(fruit):
   report_pie.data.append(fruit[fruit_name])
   report_pie.labels.append(fruit_name)

report_pie.sideLabels = 1
report_pie.sideLabelsOffset = 0.1

report_chart = Drawing(width=400, height=200)
report_chart.add(report_pie)
report.build([report_title, report_table, report_chart])

