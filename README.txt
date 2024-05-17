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
The package 'pymysql' is used mainly in connection with Python and Mysql. 
The python will connect with Mysql by typing the information of 
'Host, user, password, database and charset'. 
Then, using the 'cursor' and 'pymysql.cursors.Dictcursor' command to load the data from Mysql.
