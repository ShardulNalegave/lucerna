
from flask import Flask

app = Flask("embeddings")

@app.route("/")
def index():
    return "Hello, World!"
