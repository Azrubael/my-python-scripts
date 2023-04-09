*********************
  2023-04-09  10:28
*********************
# Sending the Email Through an SMTP Server
https://www.rfc-editor.org/rfc/rfc2821.html
https://docs.python.org/3/library/smtplib.html

As we called out, to send emails, our computers use the Simple Mail Transfer Protocol (SMTP). This protocol specifies how computers can deliver email to each other. There are certain steps that need to be followed to do this correctly. But, as usual, we won't do this manually; we’ll send the message using the built-in *smtplib* Python module.
With *smtplib*, we'll create an object that will represent our mail server, and handle sending messages to that server. If you’re using a Linux computer, you might already have a configured SMTP server like *postfix* or *sendmail*. But maybe not. Let's create a smtplib.SMTP object and try to connect to the local machine.
------------------------------------------------------------------
>>> import smtplib
>>> mail_server = smtplib.SMTP('localhost')
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  (...We deleted a bunch of lines here...)
ConnectionRefusedError: [Errno 61] Connection refused

< ConnectionRefusedError: [Errno 111] Connection refused > - [in my case]
------------------------------------------------------------------

This error means that there's no local SMTP server configured. 
But you can still connect to the SMTP server for your personal email address. Most personal email services have instructions for sending email through SMTP; just search for the name of your email service and "SMTP connection settings".
When setting this up, there are a couple of things that you'll probably need to do: Use a secure transport layer and authenticate to the service using a username and password.

Also if you want to see the SMTP messages that are being sent back and forth by the smtplib module behind the scenes, you can set the debug level on the SMTP or SMTP_SSL object. The examples in this lesson won’t show the debug output, but you might find it interesting:
>>> mail_server.set_debuglevel(1)

You can connect to a remote SMTP server using Transport Layer Security (TLS). An earlier version of the TLS protocol was called Secure Sockets Layer (SSL), and you’ll sometimes see TLS and SSL used interchangeably.

This SSL/TLS is the same protocol that's used to add a secure transmission layer to HTTP, making it HTTPS. Within the *smtplib*, there are two classes for making connections to an SMTP server: The *SMTP* class will make a direct SMTP connection, and the *SMTP_SSL* class will make a SMTP connection over SSL/TLS. Also typically, email providers wants us to provide a *username and password* to connect.
After we have the email user and password configured, we can authenticate to the email server using the SMTP object's *login* method.
If we're connected and authenticated to the SMTP server, we send the message.
See links:
https://docs.python.org/3/library/smtplib.html#smtplib.SMTP
https://docs.python.org/3/library/getpass.html
https://docs.python.org/3/library/smtplib.html#smtplib.SMTP.login
------------------------------------------------------------------
>>> import smtplib
>>> import getpass
>>> mail_server = smtplib.SMTP_SSL('smtp.example.com')
>>> mail_pass = getpass.getpass('Password? ')
Password?
>>> print(mail_pass)
It'sASecr3t!
>>> mail_server.login(sender, mail_pass)
(235, b'2.7.0 Accepted')
>>> mail_server.send_message(message)
{}
>>> mail_server.quit()
------------------------------------------------------------------

Our message was delivered successfully, so send_message returned an empty dictionary. Finally, now that the email is sent, let's close the connection to the mail server.

If the login attempt succeeds, the login method will return a tuple of the *SMTP status code* and a message explaining the reason for the status. If the login attempt fails, the module will raise a *SMTPAuthenticationError* exception:
https://tools.ietf.org/html/rfc4954#section-6
https://docs.python.org/3.8/library/smtplib.html#smtplib.SMTPAuthenticationError

`If you wrote a script to send an email message, how would you handle this exception?`

The send_message method returns a dictionary of any recipients that weren’t able to receive the message:
https://docs.python.org/3/library/smtplib.html#smtplib.SMTP.send_message


So, first, we constructed an email message by using the built-in email module's *EmailMessage* class. Next, we added an attachment to our message with the help of the built-in *mimetypes* module. Finally, we connected to a SMTP server and sent the email using the *smtplib* module's *SMTP_SSL* class, see links:
https://docs.python.org/3/library/email.html
https://docs.python.org/3/library/email.message.html
https://docs.python.org/3/library/mimetypes.html
https://docs.python.org/3/library/smtplib.html#smtplib.SMTP_SSL