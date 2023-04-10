#! /usr/bin/env python3
"""An Example email message with attachment"""

from email.message import EmailMessage
import os.path
import mimetypes
import getpass
from smtplib import SMTP_SSL
from smtplib import SMTPAuthenticationError
import ssl

message = EmailMessage()
recipient = "you@example.com"
sender = "me@example.com"
""" При отправке сообщения через службу жмейл следует учесть, что:
- ссл использовать обязательно,
- порт должен быть 465,
- требуется двухфакторная аутентификайия аккаунта гугл,
- нужен специально сгенерированый длинный пароль
"""
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
# print(message)

ssl_context = ssl.create_default_context()

mail_pass = getpass.getpass('Password? ')
mail_server = SMTP_SSL('smtp.gmail.com', port=465, context=ssl_context)

try:
    mail_server.login(sender, mail_pass)
except SMTPAuthenticationError as ex :
    print("fail to login")

mail_server.send_message(message)
print('A message sent to', recipient)
mail_server.quit()