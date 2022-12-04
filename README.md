# Hospital DBMS
## Description
A commandline based hospital database management system for managing hospital records on patients, doctors, visits,
appointment, medications, lab tests and hospital schedule. 

## Features
* Register a patient 
* Schedule / Confirm / Cancel Appointments
* Add top 200 medications
* Capture patient Visits, Prescriptions, Lab Tests and Admissions
* Discharge patients 
* Monthly stats report and beds available per ward report 
* View patient's visit history, prescriptions and lab tests

## Usage
### Installation
* Clone or download the project directory from github to your computer https://github.com/faithNassiwa/health_dbms
* Open the health_dbms folder in your favorite IDE or terminal. 
* Ensure you have all required modules for the project by running `pip install requirements.pip` to install or 
upgrade the modules. 

### MySQL Database Configuration 
* Run the database creation script sql-scripts/table_creation.sql
* Insert testing data by running sql script sql-scripts/dummy_data.sql
* Create the required views by running sql-scripts/views.sql
* Create the required stored_procedures by running the files in sql-scripts/stored_procedures
* Create the required functions by running the files in sql_scripts/functions

After successfully creating the database with its tables, sample data, views, stored_procedurs and functions, you can 
now run the application. 

### Run Hospital DBMS
* From the commandline, run `python3 python_scripts/main.py`
* Enter your MYSQL DB port, username and password
* Select user role desired from the user role menu
* Select desired action from the options menu displayed
* Enter 1 to go back to the previous menu or 0 to exit the program

## Future Work
* Fully building out the different records areas like the hospital scheduling
* Adding user permissions and roles 