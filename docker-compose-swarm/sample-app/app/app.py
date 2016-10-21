from flask import Flask
app = Flask(__name__)

import uuid
id = uuid.uuid4()

@app.route('/')
def hello_world():
    import socket
    return 'Dockerized Flask number %s' % id

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
