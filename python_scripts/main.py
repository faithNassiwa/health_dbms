from mysql.connector import connect, Error
from getpass import getpass
from sql_views import *
from sql_functions import *
from sql_stored_procedures import *

# DB Setup
print('Hospital Database Management System')
print('Hospital DB setup')

try:
    conn = connect(
        host='localhost',
        port=input('Enter database port: '),
        user=input('Enter database username: '),
        password=getpass('Enter password: '),
        database='hospital'
    )
except Error as e:
    print(e)


# Commandline Application
user_role = 0
menu_option = 0


def menu_profile():
    print('Select user role')
    print('1. Admin')
    print('2. Doctor')
    print('3. Patient')


def menu_options(x):
    if x == 1:
        print('Admin\'s menu')
        print('Quick Stats')
        print('1. Number of Available Beds')
        print('Reports')
        print('2.Monthly Stats')
        print('Appointments')
        print('3. Schedule Upcoming Appointments')
        print('4. Schedule Upcoming Appointments')
    elif x == 2:
        print('Doctor\'s menu')
        print('1. View Past Patient Visits')
        print('2. Add Patient Visit')
    elif x == 3:
        print('Patient\'s menu')
        print('1. Schedule Appointment')
        print('2. View My Past Patient Visits')
        print('3. View My Prescriptions')
    else:
        print('Wrong entry')
        menu_profile()
        user_role = input('Please enter your role: (1)-Admin, (2)Doctor, (3)-Patient : ')
        user_role = int(user_role.strip())


menu_profile()
user_role = input('Please enter your role: (1)-Admin, (2)Doctor, (3)-Patient : ')
user_role = int(user_role.strip())

while user_role != 0:
    menu_options(user_role)
    menu_option = input("Enter what you want to do from the menu above: ")
    menu_option = int(menu_option.strip())
    while menu_option != 0:
        if user_role == 1 and menu_option == 1:
            get_available_beds(conn=conn)
        if user_role == 1 and menu_option == 2:
            get_monthly_stats(conn=conn)
        if user_role == 1 and menu_option == 4:
            view_hospital_schedule(conn=conn)
        if user_role == 2 and menu_option == 1:
            view_patients_visit_summary(conn=conn)
        if user_role == 2 and menu_option == 2:
            create_visit(conn=conn)
        if user_role == 3 and menu_option == 1:
            create_appointment(conn=conn)
        menu_options(user_role)
        menu_option = input("Enter what you want to do from the menu above or 0 to go to main menu: ")
        menu_option = int(menu_option.strip())
    menu_profile()
    user_role = input('Please enter your role: (1)-Admin, (2)Doctor, (3)-Patient or 0 to exit the program: ')
    user_role = int(user_role.strip())

print('End')
conn.close()


