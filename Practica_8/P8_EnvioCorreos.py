#!/usr/bin/env python3
#este es el script llamado send_email modificado para uso personal

import argparse
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import smtplib

description="Script diseñado para enviar correos a las personas deseadas"
parser = argparse.ArgumentParser(description="Hola", epilog=description, formatter_class=argparse.RawDescriptionHelpFormatter)
parser.add_argument('-rmt', type=str , help='Correo del remitente.')
parser.add_argument('-to', type=str , help='Correo del destinatario')
parser.add_argument('-pwd', type=str , help='Contraseña del remitente')
parser.add_argument('-msg', type=str, help='Mensaje dentro del correo')
parser.add_argument('-sub', type=str, help='Asunto del correo')

params = parser.parse_args()

# create and setup the parameters of the message
email_msg = MIMEMultipart("alternative")
de = (params.rmt)
email_msg["From"] = de
#receipents = ["jose.hernandezsal@uanl.edu.mx"]
to = (params.to)
email_msg["To"] = to
sub = (params.sub)
email_msg["Subject"] = sub
pwd = (params.pwd)

# add in the message body
message = params.msg
email_msg.attach(MIMEText(message, "plain"))

# create server
server = smtplib.SMTP("smtp.office365.com:587")
server.starttls()
# Login Credentials for sending the mail
server.login(de, pwd)


# send the message via the server.
server.sendmail(email_msg["From"], to, email_msg.as_string())
server.quit()
print("successfully sent email to %s:" % (email_msg["To"]))
