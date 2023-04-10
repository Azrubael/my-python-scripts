#! /usr/bin/env python3

import email.message
import mimetypes
import os.path
from smtplib import SMTP_SSL
from smtplib import SMTPAuthenticationError
import ssl, sys
import getpass

def generate(sender, recipient, subject, body, attachment_path):
    """Creates an email with an attachment."""
    msg = email.message.EmailMessage()
    msg['From'] = sender
    msg['To'] = recipient
    msg['Subject'] = subject
    msg.set_content(body)

    if attachment_path != '':
        attachment_filename = os.path.basename(attachment_path)
        mime_type, _ = mimetypes.guess_type(attachment_path)
        mime_type, mime_subtype = mime_type.split('/', 1)
    
        with open(attachment_path, 'rb') as ap:
            msg.add_attachment(ap.read(),
                maintype=mime_type,
                subtype=mime_subtype,
                filename=attachment_filename)
    
    return msg

def send(msg, sender):
    """Sends a message to the configured SMTP SSL server."""
    mail_pass = getpass.getpass('Password? ')
    ssl_context = ssl.create_default_context()
    mail_server = SMTP_SSL('smtp.gmail.com', port=465, context=ssl_context)
    try:
        mail_server.login(sender, mail_pass)
    except SMTPAuthenticationError as ex :
        print("fail to login")
    mail_server.send_message(msg)
    mail_server.quit()


def mailservice(email_data):
    sender = email_data['sender']
    recipient = email_data['receiver']
    subject = email_data['subject']
    body = email_data['body']
    attachment_path = email_data['attachment_path']
    msg = generate(sender, recipient, subject, body, attachment_path)
    send(msg, sender)
    print('A message sent to', recipient)


if __name__ == "__main__":
    email_data = {}
    email_data['sender'] = "p_example@gmail.com"
    email_data['receiver'] = "i_example@gmail.com"
    email_data['subject'] = "test"
    email_data['body'] = "test"


    if len(sys.argv) > 1:
        email_data['attachment_path'] = sys.argv[1]
    else:
        email_data['attachment_path'] = ''

    mailservice(email_data)