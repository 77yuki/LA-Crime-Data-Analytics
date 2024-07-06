from flask import Flask, render_template, request, jsonify
import mysql.connector
import os

app = Flask(__name__)

markers = []

def get_db_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="ltcb57655",
        database="cs 338 project"
    )

def read_query_from_file(filename):
    with open(filename, 'r') as file:
        query = file.read().strip()
    return query

def read_sql_file(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        content = file.read()
    statements = content.split(';')    
    statements = [statement.strip() for statement in statements if statement.strip()]
    return statements

@app.route('/', methods=['GET', 'POST'])
def index():
    global markers
    query_name = request.args.get('query', 'F4')  # Default query is 'F4'
    most_or_least = request.args.get('most_or_least', 'Most')
    start_date = request.args.get('start_date', '2000-01-01')
    end_date = request.args.get('end_date', '2100-01-01')
    crime_type = request.args.get('crime_type', '330')
    area_name = request.args.get('area_name', 'Central')
    lat = request.args.get('lat', '34.0241')
    lon = request.args.get('lon', '-118.232')

    print(f"Query Name: {query_name}")
    print(f"Parameters - most_or_least: {most_or_least}, start_date: {start_date}, end_date: {end_date}, crime_type: {crime_type}, area_name: {area_name}")

    db = get_db_connection()
    cursor = db.cursor(dictionary=True)

    # Map query names to their corresponding file paths
    base_path = os.path.join(os.path.dirname(__file__), 'SQL Functions')
    query_files = {
        'Defult': os.path.join(base_path, 'Defult.sql'),
        'F2': os.path.join(base_path, 'F2.sql'),
        'F3': os.path.join(base_path, 'F3.sql'),
        'F4': os.path.join(base_path, 'F4.sql'),
        'F5': os.path.join(base_path, 'F5.sql'),
        'F6': os.path.join(base_path, 'F6.sql')
    }

#    # Debugging: Print paths to verify they are correct
#    for key, path in query_files.items():
#        print(f"{key} path: {path}")

    data = []
    error = None

    if query_name in query_files:
        query = read_query_from_file(query_files[query_name])
        print(f"Query before formatting: {query}")
        try:
            if query_name == 'F2':
                query = query.format(crime_type=crime_type)
            elif query_name == 'F3':
                query = query.format(most_or_least=most_or_least)
            elif query_name == 'F4':
                query = query.format(area_name=area_name)
            elif query_name == 'F6':
                query = query.format(lat=lat,lon=lon)
            print(f"Formatted Query: {query}")

            for result in cursor.execute(query, multi=True):
                if result.with_rows:
                    print("Rows produced by statement '{}':".format(result.statement))
                    data = result.fetchall()
                    print(data)
            markers = data
            print(f"Data Fetched: {data}")

        except Exception as e:
            error = str(e)
            print(f"Error: {error}")
    else:
        error = "Invalid query name"
        print(f"Error: {error}")

    cursor.close()
    db.close()
    
    return render_template('index.html', query_name=query_name, data=data, most_or_least=most_or_least, start_date=start_date, end_date=end_date, 
                           crime_type=crime_type, area_name=area_name, error=error, lat=lat, lon=lon)

@app.route('/api/markers')
def get_markers():
    global markers
    return jsonify(markers)

if __name__ == '__main__':
    app.run(debug=True)


