from flask import Flask, render_template, request, jsonify
import mysql.connector
import os

app = Flask(__name__)

markers = []

#Save the database connection to a global variable
def get_db_connection():
    return mysql.connector.connect(
        host="127.0.0.1",         # Change this to your own IP address
        user="root",              # Change this to your own MySQL username
        password="ltcb57655",              # Change this to your own MySQL password
        database="cs 338 project"   
    )


def read_query_from_file(filename):
    with open(filename, 'r') as file:
        query = file.read().strip()
    return query

#
@app.route('/', methods=['GET', 'POST'])
def index():
    global markers
    hasmarker = False
    query_name = request.args.get('query', 'Default')  # Default query is 'Default'
    most_or_least = request.args.get('most_or_least', 'Most')
    start_date = request.args.get('start_date', '04-06-2020')
    end_date = request.args.get('end_date', '04-25-2020')
    status = request.args.get('status', '')
    crime_code = request.args.get('crime_code', '756')
    area_name = request.args.get('area_name', 'Central')
    lat = request.args.get('lat', '34.052235')
    lon = request.args.get('lon', '-118.243683')

    print(f"Query Name: {query_name}")
    print(f"Parameters - most_or_least: {most_or_least}, start_date: {start_date}, end_date: {end_date}, area_name: {area_name}")

    db = get_db_connection()
    cursor = db.cursor(dictionary=True)

    # This code is based on the query name to obtain the query file path, based on the query name, 
    # please make sure all the query file are in the SQL Functions folder
    base_path = os.path.join(os.path.dirname(__file__), 'SQL Functions')
    query_files = {
        'Default': os.path.join(base_path, 'Default.sql'),
        'F1': os.path.join(base_path, 'F1.sql'),
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
    hasmarker = False
    
    if query_name in query_files:
        query = read_query_from_file(query_files[query_name])
        print(f"Query before formatting: {query}")
        try:
            if query_name == 'F1':
                query = query.format(crime_code=crime_code)
            elif query_name == 'F3':
                query = query.format(init_date=start_date, end_date=end_date, status=status)
            elif query_name == 'F4':
                query = query.format(area_name=area_name)
            elif query_name == 'F6':
                query = query.format(lat=lat,lon=lon)
            print(f"Formatted Query: {query}")

            for result in cursor.execute(query, multi=True):
                if result.with_rows:
                    print("Rows produced by statement '{}':".format(result.statement))
                    data = result.fetchall()
                    if (hasmarker == False):
                        markers = data
                        hasmarker = True

                    print(data)
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
                           crime_code=crime_code, area_name=area_name, error=error, lat=lat, lon=lon,status=status)

@app.route('/api/markers')
def get_markers():
    global markers
    return jsonify(markers)

if __name__ == '__main__':
    app.run(debug=True)



