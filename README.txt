How to create sample database:
The original data is from the United States government, the data is a .csv file. 
A new connection is created to make the base of the database, we also use the command 
'OPT_LOCAL_INFILE=1' in the advanced option.
 After that, we created a new schema and used the 
'Table Data Import Wizard' to import the .csv file with default settings. 
Finally, in the command area for the table we made, we typed 
'SELECT * FROM FILENAME.csv;', the user can now select rows in the Result Grid.

How to load sample database:
We will use Python to import and analyze the data. 
The package 'pymysql,connector' is used mainly in connection with Python and Mysql. 
The python will connect with Mysql by typing the information of 
'Host, user, password, database name'. 
Then, using the 'cursor' to make a connection with MySQL, then exceute the query of 
"select * from YOUR_TABLE_NAME" to load the data from database

Application acknowledgement:
The application is in the folder "Fancy functions/Python"
The website is created based on the "flask" package in Python. This require two application 
to be installed, Python and MySQL. MySQL need be the latest version. You also need to 
installed python with newest edition (in Microsoft store for Windows), 
then using pip command in terminal (CMD for Windows) to install two package

pip install mysql-connector-python

pip install flask mysql-connector-python

Then Make adjustment to the fields 'Host, user, password, database name' in "test file.py" 
to connect to your MySQL database. Finally, run the code and open the address
http://127.0.0.1:5000/ in your browser.
