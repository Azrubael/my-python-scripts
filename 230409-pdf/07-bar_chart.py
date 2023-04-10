#! /usr/bin/env python3
"""
Training module that makes `02.pdf` with a table and bar chart,
all contain features tested and works ok
"""

from reportlab.graphics.shapes import Drawing
from reportlab.graphics.charts.barcharts import VerticalBarChart
from reportlab.lib.styles import getSampleStyleSheet
from reportlab.lib import colors
from reportlab.platypus import SimpleDocTemplate
from reportlab.platypus import Paragraph, Spacer, Table

data = [
    ['Toyota Yaris (2007)', 22162960],
    ['Audi Q7 (2012)', 11681850],
    ['GMC Yukon (2010)', 20368707],
    ['Ford Contour (1995)', 7203108],
    ['Buick LeSabre (1987)', 22631973],
    ['Saab 900 (1987)', 8561371],
    ['Lexus GS (2003)', 21706272],
    ['Mazda MX-5 (1999)', 9745164],
    ['Hyundai Sonata (2008)', 14281079],
    ['Acura Integra (1995)', 22328544],
]

def bars_chart_create(in_data):
    bc = VerticalBarChart()
    bc.strokeColor = colors.black
    bc.data = [[]]
    bc.categoryAxis.categoryNames = []
    bc.valueAxis.valueMin = 0
    bc.valueAxis.valueMax = 0
    bc.categoryAxis.labels.angle = 90
    bc.categoryAxis.labels.fontName = 'Helvetica'
    bc.categoryAxis.labels.fontSize = 10
    bc.categoryAxis.labels.boxAnchor = 'ne'
    for item in in_data:
        if item[1] > bc.valueAxis.valueMax:
            bc.valueAxis.valueMax = item[1]
        bc.data[0].append(item[1])
        bc.categoryAxis.categoryNames.append(item[0])
    bc.valueAxis.valueStep = round(bc.valueAxis.valueMax / 10)
    print(bc.data[0])
    # bc.x = 50     # coord X on a sheet
    # bc.y = 100    # coord Y on a sheet
    bc.height = 330
    bc.width = 200
    dwg = Drawing(200,350)
    dwg.add(bc, '')
    # dwg.save(formats=['pdf'], outDir='.', fnRoot='test')
    return dwg

def generate(pdf_data):
    """Creates a new pdf file with a table"""
    file = pdf_data['filename']
    title = pdf_data['title']
    additional_info = pdf_data['summary']
    table_data = pdf_data['table']
    bars_chart_data = pdf_data['bars_chart']

    styles = getSampleStyleSheet()
    report = SimpleDocTemplate(file)
    report_title = Paragraph(title, styles["h2"])
    report_info = Paragraph(additional_info, styles["BodyText"])
    table_style = [
        ('GRID', (0,0), (-1,-1), 1, colors.black),
        ('FONTNAME', (0,0), (-1,0), 'Helvetica-Bold'),
        ('ALIGN', (0,0), (-1,-1), 'CENTER')
        ]
    report_table = Table(data=table_data, style=table_style, hAlign='LEFT')
    empty_line = Spacer(1,20)
    if bars_chart_data == None:
        report.build([report_title, empty_line, report_info, empty_line, report_table])
    else:
        chart = bars_chart_create(bars_chart_data)
        report.build([report_title, empty_line, report_info, empty_line, report_table, empty_line, chart])

if __name__ == "__main__":
    # bars_chart_create(data)

    pdf_data = {}
    pdf_data['filename'] = '02.pdf'
    pdf_data['title'] = "Sales summary for last month"
    pdf_data['summary'] = "text"
    pdf_data['table'] = [['Model', 'Revenue']] + data
    pdf_data['bars_chart'] = data
    generate(pdf_data) 