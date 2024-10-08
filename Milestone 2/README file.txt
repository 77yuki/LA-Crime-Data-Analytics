README file: 

a. How to create and load your sample database：

The data is downloaded from  https://catalog.data.gov/dataset/crime-data-from-2020-to-present. Making sure that the data is in a csv file and import the data into Mysql. 
All the data is saved in csv file which inside the folder “Milestone 2/SQL Functions”, there are two different set of data, ‘Sample’ and ‘Production’, inside the folder, the ’Sample Dataset’ and ‘Production Dataset’ include the raw data we used for the application, each csv file will account for one or several function running. 
To load the data correctly, the schema name needs to be ‘cs 338 project’, and when loading the table by using ‘Table Data Import Wizard’, users need to rename the table ‘xxxxxx_sample’ and ‘xxxxx_production’ to ‘xxxxx_table’ to ensure the function can be run correctly.
Remote connection without loading data manually is still developing.

b. How to run your working database-driven application：

The application is in the folder "Milestone 2". Users need to download the folder "templates" and "SQL Functions" with file "test.py". The html style file is ‘index.html’, which is used as a front end to show the data to the users, and ‘test.py’ is used as a bridge to connect with the MySQL database and let html communicate with the database.
The website is created based on the "flask" package in Python. This requires two applications, Python and MySQL. MySQL workbench needs at least 8.0 CE version. Users also need to installed python with newest edition (in Microsoft store for Windows), then using pip command in terminal (CMD for Windows) to install two package

pip install mysql-connector-python

pip install flask mysql-connector-python

Then Make adjustments to the fields 'Host, user, password, database name' in "test file.py" to connect to your MySQL database. Finally, run the code and open the address http://127.0.0.1:5000/ in your browser.
Notice: 
-If you cannot connect to the database, this might be because the ‘MySQL80’ server has stopped. For windows 10,  you need to open the task manager, and find the server in ‘Servers’, and run the server.
-Each function is connected to a specific name of table, please load the tables into the database correctly before running the application.

c. What features it currently supports： 

F1: The first feature/functionality is to show the specific location by latitude and longitude if our users enter any type of crime they hope to check.
F2: The second feature/functionality is to show the area with the most number of crimes.
F3: The third feature/functionality shows the location of crimes by the filtered area names and status. 
F4: The fourth feature/functionality counts the number of crimes on an hourly basis, given a certain area.
F5: The fifth feature/functionality is to show the sex distribution of the victims.
F6: The sixth feature/functionality is to find out how many crimes happened within 500 meters given a latitude and a longitude.

After opening Github, please look at the left side and there is a folder named milestone 2. This folder contains a folder named "SQL Functions". It is composed of four parts. The first part is Production, and it contains the datasets used to do tests of production and the production output of each feature. The second part is Sample and its organization follows the same logic as the first part. After that, you see the third part TestCode and this includes the codes used to test the datasets. Finally, there are the queries of the features. All folders and files other than the SQL Function folder are for html uses.
