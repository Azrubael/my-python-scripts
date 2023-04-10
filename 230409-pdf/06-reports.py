#! /usr/bin/env python3

from reportlab.platypus import SimpleDocTemplate
from reportlab.platypus import Paragraph, Spacer, Table, Image
from reportlab.lib.styles import getSampleStyleSheet
from reportlab.lib import colors

def generate(filename, title, additional_info, table_data):
    """Creates a new pdf file with a table"""
    styles = getSampleStyleSheet()
    report = SimpleDocTemplate(filename)
    report_title = Paragraph(title, styles["h1"])
    report_info = Paragraph(additional_info, styles["BodyText"])
    table_style = [
        ('GRID', (0,0), (-1,-1), 1, colors.black),
        ('FONTNAME', (0,0), (-1,0), 'Helvetica-Bold'),
        ('ALIGN', (0,0), (-1,-1), 'CENTER')
        ]
    report_table = Table(data=table_data, style=table_style, hAlign='LEFT')
    empty_line = Spacer(1,20)
    report.build([report_title, empty_line, report_info, empty_line, report_table])


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
    generate(filename, title, additional_info, table_data)
    print('A new file generated: ', filename)