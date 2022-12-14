import pandas as pd
import warnings

warnings.simplefilter("ignore")
pd.set_option('display.max_columns', None)


def create_patient(conn):
    """
    Captures and inserts patient details entered by the user into the database.
    param conn: MySQLConnection object
    return: None
    """
    first_name = input("Enter patient's first name: ")
    middle_name = input("Enter patient's middle name: ")
    last_name = input("Enter patient's last name: ")
    phone_number = int(input("Enter patient's phone number(digits only): "))
    date_of_birth = input("Enter patient's date of birth in format YYYY-MM-DD: ")
    gender = input("Enter patient's gender (Male/Female/Unknown): ")
    street = input("Enter patient's street address: ")
    city = input("Enter patient's city address: ")
    state = input("Enter patient's state address: ")
    postal_code = input("Enter patient's postal code address: ")
    country = input("Enter patient's country address: ")
    args = (first_name, middle_name, last_name, phone_number, date_of_birth, gender, street, city, state, postal_code,
            country, 0, 0)
    cursor = conn.cursor()
    row = cursor.callproc('add_patient', args)
    conn.commit()
    cursor.close()
    print(">> {} patient registered with patient id {}".format(row[11], row[12]))
    return None


def get_appointment_param(conn):
    """
    Gets appointment parameters based on inputs from a user. Provides the user available doctors from tomorrow's date
    and visit types from the database that the user can base on to make inputs.
    param conn: MySQLConnection object
    return: List of appointment details or None
    """
    doctor_no, doctor_first_name, doctor_last_name, doctor_area_of_expertise = [], [], [], []
    date_available, start_time, end_time = [], [], []
    doctors = {'Doctor ID':doctor_no, 'First Name': doctor_first_name, 'Last Name': doctor_last_name,
               'Area of Expertise': doctor_area_of_expertise, 'Date Available': date_available, 'From': start_time,
               'End': end_time}
    patient_id = int(input("Enter your patient id: "))
    cursor = conn.cursor()
    cursor.callproc('get_available_doctors')
    results = cursor.stored_results()
    if results:
        for result in results:
            for doctor in result.fetchall():
                doctor_no.append(doctor[0])
                doctor_first_name.append(doctor[1])
                doctor_last_name.append(doctor[2])
                doctor_area_of_expertise.append(doctor[3])
                date_available.append(doctor[4])
                start_time.append(doctor[5])
                end_time.append(doctor[6])
        df = pd.DataFrame(doctors)
        print(df)
        doctor_id = int(input("Enter the doctor's Id you want to see: "))
        appointment_date = input("Enter the date of the appointment in format YYYY-MM-DD: ")
        appointment_time = input("Enter the time of the appointment in format HH:MI: ")
        visit_type = """
                SELECT * FROM hospital.visit_type;
            """
        df = pd.read_sql(visit_type, conn)
        print(df)
        visit_type = int(input("Enter your visit type code number from list above: "))
        notes = input("Enter any follow-up notes: ")
        cursor.close()
        return [patient_id, doctor_id, appointment_date, appointment_time, visit_type, notes, 0]
    else:
        print(">> No available timeslots")


def create_appointment(conn):
    """
    Inserts an appointment record in the database based on user input.
    param conn: MySQLConnection object
    return: None
    """
    args = get_appointment_param(conn=conn)
    cursor = conn.cursor()
    row = cursor.callproc('create_appointment', tuple(args))
    conn.commit()
    result = row[6]
    cursor.close()
    print(">> {} appointment request made, someone will contact with further instructions.".format(result))
    return None


def create_visit(conn):
    """
    Captures and inserts visit, prescription, lab test and admits user input into the database
    param conn: MySQLConnection object
    return: None
    """
    doctor_id = int(input("Enter the doctor's Id: "))
    patient_id = int(input("Enter the patient's Id: "))
    notes = input("Enter visit notes: ")
    diagnosis = input("Enter diagnosis: ")
    status = input("Enter visit status (Follow-up or Complete): ")
    visit_type_id = int(input("Enter your visit type: "))
    visit_date = input(
        "Enter the date of the visit in format YYYY-MM-DD: ")  ## add default value in db that is to be overriden if user enters nothing?
    visit_time = input("Enter the time of the visit in format HH:MI:SS: ")

    args = (diagnosis, status, visit_date, visit_time, visit_type_id, notes, patient_id, doctor_id, 0, 0)
    cursor = conn.cursor()
    row = cursor.callproc('create_visit', tuple(args))
    conn.commit()
    result = row[8]
    added_visit_id = row[9]
    print("{} visit added.".format(result))
    print("\n")

    add_prescription = int(input("Do you want to add prescription? Enter 1 for yes, 0 for no: "))
    if add_prescription == 1:
        medication_name = input("Enter medication name: ")
        get_meds_ids = """
                    select * from medication where name like %s
                    """
        cursor.execute(get_meds_ids, ("%" + medication_name + "%",))
        for result in cursor.fetchall():
            print(result)
        medication_id = int(input("Enter the medication id from the list above: "))
        daily_dose = input("Enter the medication daily dose: ")
        number_of_days = input("Enter the medication number of days: ")
        row = cursor.callproc('add_prescription', (added_visit_id, medication_id, daily_dose, number_of_days, 0))
        conn.commit()
        print(">> Medication id {} added".format(row[1]))
    print("\n")

    add_lab_test = int(input("Do you want to add lab test? Enter 1 for yes, 0 for no: "))
    if add_lab_test == 1:
        lab_test_name = input("Enter lab test name: ")
        get_lab_test_ids = """
                            select * from laboratory_test where name like %s
                            """
        cursor.execute(get_lab_test_ids, ("%" + lab_test_name + "%",))
        for result in cursor.fetchall():
            print(result)
        laboratory_test_id = int(input("Enter the laboratory test id from the list above: "))
        perform_by_date = input("Enter the due date for the lab test in format YYYY-MM-DD: ")
        row = cursor.callproc('perform_lab_test', (added_visit_id, laboratory_test_id, perform_by_date, 0))
        conn.commit()
        print(">> Laboratory id {} added".format(row[1]))
    print("\n")

    admit_patient = int(input("Do you want to admit this patient? Enter 1 for yes, 0 for no: "))
    if admit_patient == 1:
        get_wards = """ select ward_number, name from ward"""
        cursor.execute(get_wards)
        ward_id = []
        ward_name = []
        ward_number_of_available_beds = []
        ward_dic = {'Ward ID': ward_id, 'Ward Name': ward_name, 'Available Beds': ward_number_of_available_beds}
        for result in cursor.fetchall():
            ward_id.append(result[0])
            ward_name.append(result[1])
            func = """
                    SELECT get_available_beds(%s)
                """
            cursor.execute(func, (result[0],))
            result = cursor.fetchone()
            ward_number_of_available_beds.append(result[0])
        df = pd.DataFrame(ward_dic)
        print(df)
        ward = int(input("Enter the ward id: "))
        row = cursor.callproc('admit_patient_from_visit', (added_visit_id, ward, 0))
        conn.commit()
        print(">> {} admission added".format(row[2]))

    cursor.close()
    return None


def get_patient_visit(conn):
    """
    Gets and saves all patient's visits in a data frame that is printed as output.
    param conn: MySQLConnection object
    return: None
    """
    patient_id = int(input("Enter the patient's Id: "))
    cursor = conn.cursor()
    cursor.callproc('get_patient_visits', (patient_id,))
    results = cursor.stored_results()
    visit_date, visit_time, doctor_last_name, visit_type, diagnosis, notes = [], [], [], [], [], []
    patient_visits = {'Visit Date': visit_date, 'Visit Time': visit_time, 'Doctor Last Name': doctor_last_name,
                      'Visit Type':  visit_type, 'Diagnosis': diagnosis, 'Doctor Notes': notes }
    if results:
        for result in results:
            for visit in result.fetchall():
                visit_date.append(visit[0])
                visit_time.append(visit[1])
                doctor_last_name.append(visit[2])
                visit_type.append(visit[3])
                diagnosis.append(visit[4])
                notes.append(visit[5])
        df = pd.DataFrame(patient_visits)
        print(df)
    else:
        print("No visits yet")
    cursor.close()
    return None


def get_patient_prescriptions(conn):
    """
    Gets and saves all patient's prescriptions in a data frame that is printed as output.
    param conn: MySQLConnection object
    return: None
    """
    patient_id = int(input("Enter the patient's Id: "))
    cursor = conn.cursor()
    cursor.callproc('get_patient_prescriptions', (patient_id,))
    results = cursor.stored_results()
    prescribed_date, medication, daily_dose, number_of_days = [], [], [], []
    patient_prescriptions = {'Prescription Date':prescribed_date, 'Medication': medication, 'Daily Dose': daily_dose,
                             'Number of Days': number_of_days}
    if results:
        for result in results:
            for presc in result.fetchall():
                prescribed_date.append(presc[0])
                medication.append(presc[1])
                daily_dose.append(presc[2])
                number_of_days.append(presc[3])
        df = pd.DataFrame(patient_prescriptions)
        print(df)

    else:
        print(">> No prescriptions yet")
    cursor.close()
    return None


def get_patient_labs(conn):
    """
        Gets and saves all patient's performed laboratory tests in a data frame that is printed as output.
        param conn: MySQLConnection object
        return: None
    """
    patient_id = int(input("Enter the patient's Id: "))
    cursor = conn.cursor()
    cursor.callproc('get_patient_lab_results', (patient_id,))
    results = cursor.stored_results()
    lab_test, test_date, test_results, performed_on = [], [], [], []
    patient_labs = {'Lab Test':lab_test, 'Test Taken On': test_date, 'Lab Results': test_results,
                             'Result Date': performed_on}
    if results:
        for result in results:
            for lab in result.fetchall():
                lab_test.append(lab[0])
                test_date.append(lab[1])
                test_results.append(lab[2])
                performed_on.append(lab[3])
        df = pd.DataFrame(patient_labs)
        print(df)

    else:
        print("No lab tests yet")
    cursor.close()
    return None


def add_lab_results(conn):
    """
    Updates results to the laboratory test performed in the database.
    param conn: MySQLConnection object
    return: None
    """
    confirm = 0
    visit_id = int(input("Enter the visit id: "))
    laboratory_test_id = int(input("Enter the laboratory test id: "))
    query = """
            select * from performs_lab_test where visit_id = %s and laboratory_test_id = %s
    """
    cursor = conn.cursor()
    cursor.execute(query, (visit_id, laboratory_test_id))
    result = cursor.fetchall()
    if result:
        for row in result:
            print(' '.join(str(x) for x in row))
        confirm = int(input("Is this the correct laboratory test? Enter 1 for Yes, 0 for No: "))
    else:
        print('>> Can not find a lab test for this visit. Please enter a visit with a lab test. ')

    if confirm == 1:
        test_results = input("Enter the laboratory test results: ")
        performed_on = input("Enter date the test was performed on in format YYYY-MM-DD: ")
        row = cursor.callproc('add_lab_test_results', (visit_id, laboratory_test_id, test_results, performed_on, 0))
        conn.commit()
        print(">> {} lab result added".format(row[4]))
    else:
        print('>> There is no lab test with id {} on the visit id {}'.format(laboratory_test_id, visit_id))
    cursor.close()
    return None


def discharge_patient(conn):
    """
    Updated the discharge date and time in the admits table in the database.
    param conn: MySQLConnection object
    return: None
    """
    patient_id = int(input("Enter the patient's Id: "))
    cursor = conn.cursor()
    row = cursor.callproc('discharge_patient', (patient_id, 0))
    conn.commit()
    print(">> Discharged {} patient ".format(row[1]))
    if row[1] == 0:
        print(f'>> Patient with patient {patient_id} has no admission record, please enter a patient id who is admitted.')
    cursor.close()
    return None


def get_appointment_details(conn):
    """
    Get appointments details for a specific patient from the database and returns it a dataframe.
    param conn: MySQLConnection object
    return: A dataframe containing appointments details.
    """
    cursor = conn.cursor()
    get_appointment_patient = """
            select a.id, p.first_name, p.last_name, p.date_of_birth, a.appointment_date, a.appointment_time, a.status,
            p.phone_number from appointment a, patient p
            where a.patient_id = p.id and p.first_name like %s and p.last_name like %s and status = 'New'
            order by a.appointment_date desc
    """
    patient_first_name = input("Enter patient's first name: ")
    patient_last_name = input("Enter patient's last name: ")
    cursor.execute(get_appointment_patient, ('%' + patient_first_name + '%', '%' + patient_last_name + '%'))
    appointment_id = []
    patient_f_name = []
    patient_l_name = []
    patient_dob = []
    appointment_date = []
    appointment_time = []
    status = []
    phone_number = []
    appointment_dic = {'Appointment ID': appointment_id, 'First Name': patient_f_name, 'Last Name': patient_l_name,
                       'DOB': patient_dob, 'Appointment Date': appointment_date, 'Appointment Time': appointment_time,
                       'Status': status, 'Phone Number': phone_number }
    for result in cursor.fetchall():
        appointment_id.append(result[0])
        patient_f_name.append(result[1])
        patient_l_name.append(result[2])
        patient_dob.append(result[3])
        appointment_date.append(result[4])
        appointment_time.append(result[5])
        status.append(result[6])
        phone_number.append(result[7])
    df = pd.DataFrame(appointment_dic)
    cursor.close()
    return df


def cancel_appointment(conn):
    """
    Deletes an appointment using the stored procedure in the database and prints a message if deleted successfully.
    param conn: MySQLConnection object
    return: None
    """
    cursor = conn.cursor()
    result = get_appointment_details(conn=conn)
    if len(result) > 0:
        print(result)
        appointment_id = int(input("Enter the appointment id: "))
        row = cursor.callproc('cancel_appointment', (appointment_id, 0))
        conn.commit()
        print(">> Deleted/cancelled {} appointment".format(row[1]))
    else:
        print(">> Can't find appointment under the patient's name.")
    cursor.close()
    return None


def confirm_appointment(conn):
    """
    Updates the appointment status to upcoming using the stored procedure in the database and prints a message if update
    is made successfully and if otherwise.
    param conn: MySQLConnection object
    return: None
    """
    cursor = conn.cursor()
    result = get_appointment_details(conn=conn)
    if len(result) > 0:
        print(result)
        appointment_id = int(input("Enter the appointment id: "))
        row = cursor.callproc('confirm_appointment', (appointment_id, 0))
        conn.commit()
        print(">> Confirmed {} appointment".format(row[1]))
    else:
        print(">> No new appointment requests for this patient")
    cursor.close()
    return None
