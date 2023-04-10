#! /usr/bin/env python3

import locale
from reportlab.graphics.shapes import Drawing
from reportlab.graphics.charts.barcharts import VerticalBarChart
from reportlab.lib.styles import getSampleStyleSheet
from reportlab.lib import colors
from reportlab.platypus import SimpleDocTemplate
from reportlab.platypus import Paragraph, Spacer, Table


def generate(pdf_data):
    """Creates a new pdf file with a table.
    """
    file = pdf_data['filename']
    title = pdf_data['title']
    additional_info = pdf_data['summary']
    table_data = pdf_data['table']
    bars_chart_data = pdf_data['bars_chart']
    chart_legend = pdf_data['chart_legend']
    chart_note = pdf_data['chart_note']
    
    note_style = styles["h3"]
    note_style.alignment = 1

    styles = getSampleStyleSheet()
    report = SimpleDocTemplate(file)
    report_title = Paragraph(title, styles["h1"])
    report_info = Paragraph(additional_info, styles["BodyText"])
    table_style = [
        ('GRID', (0,0), (-1,-1), 1, colors.black),
        ('FONTNAME', (0,0), (-1,0), 'Helvetica-Bold'),
        ('ALIGN', (0,0), (-1,-1), 'CENTER')
        ]
    report_table = Table(data=table_data, style=table_style, hAlign='LEFT')
    empty_line = Spacer(1,20)
    if bars_chart_data == None:
        report.build([report_title, empty_line, report_info,
                      empty_line, report_table])
    else:
        report_bars_chart = bars_chart_create(bars_chart_data)
        report_chart_title = Paragraph(chart_legend, styles["h1"])
        report_chart_note = Paragraph(chart_note, note_style)

        report.build([report_title, empty_line, report_info,
                      empty_line, report_table, empty_line,
                      report_chart_title, report_chart_note,
                      empty_line, report_bars_chart])


def bars_chart_create(in_data):
    """Generates a bar chart object `bc`.
    """
    locale.setlocale(locale.LC_ALL, 'en_US.UTF8')
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
        item_price = round(locale.atof(item[2].strip("$")))
        item_profit = item[3]*item_price
        if item_profit > bc.valueAxis.valueMax:
            bc.valueAxis.valueMax = item_profit
        bc.data[0].append(item_profit)
        bc.categoryAxis.categoryNames.append(item[1])
    print(bc.data[0])
    bc.valueAxis.valueStep = round(bc.valueAxis.valueMax / 10)
    bc.height = 330
    bc.width = 330
    bc.x = 50
    dwg = Drawing(350, 350)
    dwg.add(bc)
    # dwg.save(formats=['pdf'], outDir='.', fnRoot='test')
    return dwg