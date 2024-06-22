from flask import Flask, render_template, jsonify

app = Flask(__name__)

# this is where the crime data should be
crime_data = [
    {'lat': 37.7749, 'lng': -122.4194, 'content': 'San Francisco'},
    {'lat': 37.7849, 'lng': -122.4094, 'content': 'Marker 2'}
]

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/api/markers')
def markers():
    return jsonify(crime_data)

if __name__ == '__main__':
    app.run(debug=True)
