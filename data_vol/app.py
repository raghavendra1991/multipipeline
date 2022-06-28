from markupsafe import escape
from flask import Flask, abort

PORT = 5000

app = Flask(__name__)


@app.route('/')
@app.route('/index/')
def hello():
    return '<h1>Hello, World This is my first project !</h1>'
if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=PORT)
