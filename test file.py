from flask import Flask, render_template, request
import mysql.connector

app = Flask(__name__)

def get_data_from_db(query):
    # 连接到 MySQL 数据库
    connection = mysql.connector.connect(
        host='localhost',
        user='root',
        password='ltcb57655',
        database='cs 338 project'
    )

    # 创建一个游标对象
    cursor = connection.cursor()

    # 执行查询
    cursor.execute(query)

    # 获取所有结果
    results = cursor.fetchall()

    # 获取列名
    column_names = [i[0] for i in cursor.description]

    # 关闭游标和连接
    cursor.close()
    connection.close()

    return column_names, results

@app.route('/', methods=['GET', 'POST'])
def index():
    query = "SELECT * FROM sample"  # 默认查询
    if request.method == 'POST':
        query = request.form['query']  # 获取用户输入的查询

    column_names, data = get_data_from_db(query)
    return render_template('index.html', columns=column_names, data=data, query=query)

if __name__ == '__main__':
    app.run(debug=True)


