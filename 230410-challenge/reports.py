#! /usr/bin/env python3

import locale
from reportlab.graphics.shapes import Drawing
from reportlab.graphics.charts.barcharts import VerticalBarChart
from reportlab.lib.styles import getSampleStyleSheet
from reportlab.lib import colors
from reportlab.platypus import SimpleDocTemplate
from reportlab.platypus import Paragraph, Spacer, Table



def generate(pdf_data):
    """Creates a new pdf file with a table"""
    file = pdf_data['filename']
    title = pdf_data['title']
    additional_info = pdf_data['summary']
    table_data = pdf_data['table']
    bars_chart_data = pdf_data['bars_chart']

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
        report.build([report_title, empty_line, report_info, empty_line, report_table])
    else:
        report_bars_chart = bars_chart_create(bars_chart_data)
        report.build([report_title, empty_line, report_info, empty_line, report_table, report_bars_chart])


def bars_chart_create(in_data):

    locale.setlocale(locale.LC_ALL, 'en_US.UTF8')

    drawing = Drawing(width=400, height=200)
    bar_chart = VerticalBarChart()
    bar_chart.x = len(in_data)
    bar_chart.y = in_data[-1][3]
    bar_chart.strokeColor = colors.black
    bar_chart.data = []
    bar_chart.valueAxis.valueMin = 0
    bar_chart.valueAxis.valueMax = 0
    bar_chart.categoryAxis.labels.angle = 90
    bar_chart.categoryAxis.categoryNames = []
    for item in in_data:
        item_price = round(locale.atof(item[2].strip("$")))
        item_profit = item[3]*item_price
        if item_profit > bar_chart.valueAxis.valueMax:
            bar_chart.valueAxis.valueMax = item_profit
        print(item[1], '$'+str(item_profit))
        bar_chart.data.append([item_profit])
        bar_chart.categoryAxis.categoryNames.append(item[1])
    bar_chart.valueAxis.valueStep = round(bar_chart.valueAxis.valueMax / 100)
    return drawing.add(bar_chart)


if __name__ == "__main__":
    filename = 'test_report.pdf'
    title = 'Title with Style [h1]'
    additional_info = 'Body text'
    table_data  = [
        ['Name', 'Amount', 'Mass'],
        ["elderberries", 19, 1.0],
        ["figs", 15, 0.5],
        ["apples", 25, 2.89],
        ["durians", 37, 1.79],
        ["bananas", 57, 5.7],
        ["cherries", 87, 1.37],
        ["grapes", 17, 7.5]
        ]
    bars_chart_data = None
    generate(filename, title, additional_info, table_data, bars_chart_data)
    print('A new file generated: ', filename)