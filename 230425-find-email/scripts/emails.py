#! /usr/bin/env python3

import os, sys, csv, re


def populate_dictionary(filename):
    """Populate a dictionary with name/email pairs."""
    email_dictionary = {}
    with open(filename) as f:
        lines = csv.reader(f, delimiter=',')
        for row in lines:
            name = str(row[0])
            email_dictionary[name] = row[1]
    return email_dictionary


def find_email(username, csv_file_location):
    """Return an email if one of user names matches"""
    first_name = (username['first_name']).lower()
    last_name = (username['last_name']).lower()
    full_name = first_name + ' ' + last_name
    email_dictionary = populate_dictionary(csv_file_location)
    if email_dictionary.get(full_name):
        return email_dictionary.get(full_name)
    else:
        pattern = r'^[' + first_name + '|' + last_name + ']'
        for name, email in email_dictionary.items():
            result = re.search(pattern, name.lower())
            if result != None:
                return "Full name: {}; Email: {}".format(name, email)
    return "No email address found"


def main(argv):
    csv_file_location = os.path.join(os.path.dirname(__file__), '../data/user_emails.csv')
    if len(sys.argv) < 2:
        print('Missing search name')
        return None
    username = {}
    username['first_name'] = sys.argv[1]
    if len(sys.argv) > 2:
        username['last_name'] = sys.argv[2]
    else:
        username['last_name'] = ''
    print(find_email(username, csv_file_location))
    return None

if __name__ == '__main__':
    main(sys.argv)
