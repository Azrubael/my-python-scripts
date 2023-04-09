#! /usr/bin/env python3
"""An Example email message with attachment"""

from email.message import EmailMessage
import os.path
import mimetypes

message = EmailMessage()
recipient = "you@example.com"
sender = "me@example.com"
message['From'] = sender
message['To'] = recipient
message['Subject'] = 'Greetings from {} to {}!'.format(sender, recipient)
body = """Hey there!

I'm learning to send emails using Python!"""

message.set_content(body)
attachment_path = "230409-example2.png"
attachment_filename = os.path.basename(attachment_path)
mime_type, _ = mimetypes.guess_type(attachment_path)
print(mime_type)

mime_type, mime_subtype = mime_type.split('/', 1)
print(mime_type)
print(mime_subtype)

with open(attachment_path, 'rb') as ap:
    message.add_attachment(ap.read(),
        maintype=mime_type,
        subtype=mime_subtype,
        filename=os.path.basename(attachment_path))

print(message)
