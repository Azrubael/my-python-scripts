import socket

def check_mysql_connection(host, port):
    # Создаем сокет
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.settimeout(5)  # Устанавливаем тайм-аут в 5 секунд
    try:
        # Пытаемся подключиться к указанному хосту и порту
        sock.connect((host, port))
        print("Connected successfully")
    except socket.error as e:
        # Если возникла ошибка, выводим сообщение
        print(f"Connection failed: {e}")
    finally:
        # Закрываем сокет
        sock.close()

# Задаем хост и порт MySQL
host = 'db01'  # Замените на адрес вашего MySQL-сервера
port = 3306     # Порт MySQL по умолчанию

# Вызываем функцию для проверки соединения
check_mysql_connection(host, port)
