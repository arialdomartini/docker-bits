#!/usr/bin/env python
import pika

connection = pika.BlockingConnection(pika.ConnectionParameters(
        host='some-rabbit'))
channel = connection.channel()

channel.queue_declare(queue='other')

channel.basic_publish(exchange='',
                      routing_key='other',
                      body='Hello World!')

connection.close()
