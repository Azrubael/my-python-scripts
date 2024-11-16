import pymysql
import sys

"""
The script to connect and make a simple query to MySQL server. It have to reply with MySQL version.
Before using you have to make some preparations:
```bash
pip3 install pymysql
python3 <this_script_name>.py
```

Example:
    $ python3 mysql_check2.py
Connected successfully
MySQL Server version: 5.5.68-MariaDB
"""

def check_mysql_connection(host, port, user, password):
    try:
        # An attempt to connect to MySQL server
        connection = pymysql.connect(host=host, port=port, user=user, password=password)
        print("Connected successfully")

        # A simple query
        with connection.cursor() as cursor:
            cursor.execute("SELECT VERSION()")
            result = cursor.fetchone()
            # My SQL server's version output
            print(f"MySQL Server version: {result[0]}")

    except pymysql.MySQLError as e:
        print(f"Connection failed: {e}")
    finally:
        if 'connection' in locals():
            connection.close()  # Закрываем соединение

# Задаем хост, порт, пользователя и пароль MySQL
host = 'db01'               # MySQL server
port = 3306                 # MySQL port
user = 'your_username'      # MySQL user
password = 'your_password'  # MySQL user's password

check_mysql_connection(host, port, user, password)
