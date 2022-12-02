from mysql.connector import connect, Error
from getpass import getpass
from sql_views import *
from sql_functions import *
from sql_stored_procedures import *
from utils import *

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
doctor_id = 0


def menu_profile():
    print('Select user role')
    print('1. Admin')
    print('2. Doctor')
    print('3. Patient')


def menu_options(x):
    if x == 1:
        print('Admin\'s menu')
        print(' **** Patient ****')
        print('1. Add Patient')  # create add patient

        print(' **** Reports ****')
        print('2. Number of Available Beds')  # all wards
        print('3.Monthly Stats')
        print('4.Hospital Schedule')

        print(' **** Medications ****')
        print('5. Add top 200 Medications')

        print(' **** Appointments ****')
        print('6. Schedule Upcoming Appointments')  # Faith
        print('7. Cancel Appointment')  # delete

    elif x == 2:
        print('Doctor\'s menu')
        print('1. Add Patient Visit')
        print('2. View Past Patient Visits')
        print('3. Add Lab Result')
        print('4. Discharge a Patient')

    elif x == 3:
        print('Patient\'s menu')
        print('1. Schedule Appointment')
        print('2. View My Past Visits')  # visits
        print('3. View My Prescriptions')   # create_get_patient_prescription
    else:
        print('Wrong entry')
        menu_profile()


menu_profile()
user_role = input('Please enter your role: (1)-Admin, (2)Doctor, (3)-Patient : ')
user_role = int(user_role.strip())

while user_role != 0:
    menu_options(user_role)
    menu_option = input("Enter what you want to do from the menu above: ")
    menu_option = int(menu_option.strip())
    while menu_option != 0:
        if user_role == 1 and menu_option == 2:
            get_available_beds(conn=conn)
        if user_role == 1 and menu_option == 3:
            get_monthly_stats(conn=conn)
        if user_role == 1 and menu_option == 4:
            view_hospital_schedule(conn=conn)
        if user_role == 1 and menu_option == 5:
            upload_meds_data(conn=conn)
        if user_role == 1 and menu_option == 7:
            cancel_appointment(conn=conn)
        if user_role == 2 and menu_option == 1:
            create_visit(conn=conn)
        if user_role == 2 and menu_option == 2:
            view_patients_visit_summary(conn=conn)
        if user_role == 2 and menu_option == 3:
            add_lab_results(conn=conn)
        if user_role == 2 and menu_option == 4:
            discharge_patient(conn=conn)
        if user_role == 3 and menu_option == 1:
            create_appointment(conn=conn)
        print('\n')
        menu_options(user_role)
        menu_option = input("Enter what you want to do from the menu above or 0 to go to main menu: ")
        menu_option = int(menu_option.strip())
        print('\n')
    menu_profile()
    user_role = input('Please enter your role: (1)-Admin, (2)Doctor, (3)-Patient or 0 to exit the program: ')
    user_role = int(user_role.strip())
    print('\n')

print('End')
conn.close()


