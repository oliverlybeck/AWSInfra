from flask import Flask, render_template, request
import random

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/pick', methods=['POST'])
def pick():
    number = request.form.get('number')
    random_number = int(number) * 10
    return render_template('result.html', NUMBER=random_number)

def start():
    app.run(debug=False)


