import pika
""" Програма отримує повідомлення з сервісу черг RabbirMQ
і друкує його в stdout."""


queue_host: "YOUR_RABBITMQ_HOST"
queue_user: "YOUR_RABBITMQ_USERNAME"
queue_pass: "YOUR_RABBITMQ_PASSWORD"
queue_name: "YOUR_QUEUE_NAME"

# Підключення до RabbitMQ сервера
connection = pika.BlockingConnection(pika.ConnectionParameters(queue_host, 5672, '/', pika.PlainCredentials(queue_user, queue_pass)))
channel = connection.channel()

# Створення черги з ім'ям queue_name
channel.queue_declare(queue=queue_name)

# Функція, яка викликається при отриманні повідомлення
def callback(ch, method, properties, body):
    print(" [x] Received %r" % body)

# Підписуємося на чергу 'hello' та вказуємо функцію-обробник
channel.basic_consume(queue=queue_name, on_message_callback=callback, auto_ack=True)

print(' [*] Waiting for messages. To exit press CTRL+C')
channel.start_consuming()