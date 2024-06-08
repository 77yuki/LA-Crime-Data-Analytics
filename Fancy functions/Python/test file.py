from flask import Flask, render_template, request
import mysql.connector

app = Flask(__name__)

def get_data_from_db(query):
    # connect to MySQL database
    connection = mysql.connector.connect(
        host='localhost', # Enter your servername name or IP "normally localhost or 127.0.0.1"
        user='root', # Enter your user name, defult name is root
        password='', // Enter your password
        database='' // Enter your database name
    )

    # create a cursor 
    cursor = connection.cursor()

    # execute searching
    cursor.execute(query)

    # obtain all the result
    results = cursor.fetchall()

    # obtain column names
    column_names = [i[0] for i in cursor.description]

    # close cursor and connection
    cursor.close()
    connection.close()

    return column_names, results

@app.route('/', methods=['GET', 'POST'])
def index():
    query = "SELECT * FROM (replace with your table name)"  # default searching
    if request.method == 'POST':
        query = request.form['query']  # execute the command made by user

    column_names, data = get_data_from_db(query)
    return render_template('index.html', columns=column_names, data=data, query=query)

if __name__ == '__main__':
    app.run(debug=True)


