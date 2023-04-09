*********************
  2023-04-09  08:42
*********************
# Introduction to Python Email Library

Email messages -- even messages with images and attachments -- are actually complicated text structures made entirely of readable strings!

SMTP
https://tools.ietf.org/html/rfc2821.html
MIME
https://tools.ietf.org/html/rfc2045

The Simple Mail Transfer Protocol *SMTP* and Multipurpose Internet Mail Extensions *MIME* standards define how email messages are constructed. The email built-in Python module lets us easily construct email messages.

======= email.message.EmailMessage =======
https://docs.python.org/3/library/email.message.html#email.message.EmailMessage
We'll start by using the email.message.EmailMessage class to create an empty email message.
>>> from email.message import EmailMessage
>>> message = EmailMessage()
>>> recipient = "you@example.com"
>>> sender = "me@example.com"
>>> message['From'] = sender
>>> message['To'] = recipient
>>> message['Subject'] = 'Greetings from {} to {}!'.format(sender, recipient)
>>> body = """Hey there!
...
... I'm learning to send emails using Python!"""
>>> message.set_content(body)
>>> print(message)
From: me@example.com
To: you@example.com
Subject: Greetings from me@example.com to you@example.com!
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Hey there!

I'm learning to send email using Python!
----------------------------------------

Printing the message object gives us the string representation of that object. The email library has a function that converts the complex EmailMessage object into something that is fairly human-readable. Since this is an empty message, there isn't anything to see yet. Let's try adding the sender and recipient to the message and see how that looks.

*From*, *To*, and *Subject* are examples of email header fields. They’re key-value pairs of labels and instructions used by email clients and servers to route and display the email. They’re separate from the email's *message body*, which is the main content of the message.

The *set_content()* method also automatically added a couple of headers that the email infrastructure will use when sending this message to another machine. Remember in an earlier course, when we talked about *character encodings*? The Content-Type and *Content-Transfer-Encoding* headers tell email clients and servers how to interpret the bytes in this email message into a string.