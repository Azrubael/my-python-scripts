import boto3
""" Програма отримує повідомлення з сервісу черг AWS SQS
і друкує його в stdout. """

# Підключення до сервісу AWS SQS
sqs = boto3.client('sqs', region_name='eu-central-1')  

# URL черги SQS
# Замініть 'your-queue-url' на URL своєї черги AWS SQS
queue_url = 'your-queue-url'

# Отримання повідомлень з черги та їх виведення в stdout
while True:
    response = sqs.receive_message(
        QueueUrl=queue_url,
        AttributeNames=[
            'All'
        ],
        MaxNumberOfMessages=1,
        MessageAttributeNames=[
            'All'
        ],
        VisibilityTimeout=0,
        WaitTimeSeconds=0
    )

    if 'Messages' in response:
        for message in response['Messages']:
            # Виведення повідомлення в stdout
            print(message['Body'])
            # Позначення повідомлення як обробленого
            sqs.delete_message(
                QueueUrl=queue_url,
                ReceiptHandle=message['ReceiptHandle']
            )
    else:
        print('Queue is emty.')