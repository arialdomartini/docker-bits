import pika

connection = pika.BlockingConnection(pika.ConnectionParameters(
        host='some-rabbit'))
channel = connection.channel()

channel.queue_declare(queue='other')

print(' [*] Waiting for messages. To exit press CTRL+C')

def callback(ch, method, properties, body):
    print(" [x] Received %r" % (body,))

channel.basic_consume(callback,
                      queue='other',
                      no_ack=True)

channel.start_consuming()
