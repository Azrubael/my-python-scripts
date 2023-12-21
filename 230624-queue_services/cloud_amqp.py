#!/bin/bash
"""Скрипт Bash, який використовує утиліту curl для отримання повідомлень з вказаного сервісу черги повідомлень CloudAMQP та друкує їх в stdout."""

# URL до сервісу черги
queue_url="YOUR_QUEUE_URL_HERE"

# Отримання повідомлення з сервісу черги за допомогою HTTP GET запиту
message=$(curl -s $queue_url)

# Друк отриманого повідомлення в stdout
echo $message
