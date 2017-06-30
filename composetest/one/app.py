from flask import Flask
from redis import Redis

app = Flask(__name__)
redis = Redis(host='redis', port=6379)

@app.route("/")
def hello():

    return "Hello! This is the App 1."

if __name__ == "__main__":
    app.run(host="0.0.0.0:5000", debug=True)
