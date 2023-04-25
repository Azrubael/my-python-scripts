#! /usr/bin/env python3
import unittest
from emails import find_email


class EmailsTest(unittest.TestCase):
    def test_basic(self):
        testcase = {"first_name": "Bree", "last_name": "Campbell"}
        csv_file_location = '../data/user_emails.csv'
        expected = "Full name: Blossom Gill; Email: blossom@abc.edu"
        self.assertEqual(find_email(testcase, csv_file_location), expected)


    def test_basic(self):
        testcase = {"first_name": "bree", "last_name": ""}
        csv_file_location = '../data/user_emails.csv'
        expected = "Full name: Blossom Gill; Email: blossom@abc.edu"
        self.assertEqual(find_email(testcase, csv_file_location), expected)


    def test_basic(self):
        testcase = {"first_name": "", "last_name": ""}
        csv_file_location = '../data/user_emails.csv'
        expected = "No email address found"
        self.assertEqual(find_email(testcase, csv_file_location), expected)


    def test_basic(self):
        testcase = {"first_name": "123", "last_name": "22"}
        csv_file_location = '../data/user_emails.csv'
        expected = "No email address found"
        self.assertEqual(find_email(testcase, csv_file_location), expected)


if __name__ == '__main__':
    unittest.main()