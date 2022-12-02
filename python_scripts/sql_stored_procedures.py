import pandas as pd


def get_appointment_param(conn):
    doctor_id, appointment_date, appointment_time, visit_type, notes = 0, 0, 0, 0, 0
    patient_id = int(input("Enter your patient id: "))
    cursor = conn.cursor()
    cursor.callproc('get_available_doctors')
    doctors = []
    results = cursor.stored_results()

    if results:
        for result in results:
            for doctor in result.fetchall():
                doctor_no = doctor[0]
                doctor_first_name = doctor[1]
                doctor_last_name = doctor[2]
                doctor_area_of_expertise = doctor[3]
                doctors.append(str(doctor_no) + "." + doctor_first_name + " " + doctor_last_name + " "
                               + doctor_area_of_expertise)
        print(doctors)
        doctor_id = int(input("Enter the doctor's Id you want to see: "))
        appointment_date = input("Enter the date of the appointment in format YYYY-MM-DD: ")
        appointment_time = input("Enter the time of the appointment in format HH:MI: ")
        visit_type = int(input("Enter your visit type"))
        notes = input("Enter any follow-up notes: ")
        cursor.close()
    else:
        print("No available timeslots")
    return [patient_id, doctor_id, appointment_date, appointment_time, visit_type, notes, 0]


def create_appointment(conn):
    args = get_appointment_param(conn=conn)
    cursor = conn.cursor()
    row = cursor.callproc('create_appointment', tuple(args))
    conn.commit()
    result = row[6]
    cursor.close()
    print("{} appointment request made, someone will contact with further instructions.".format(result))


def create_visit(conn):
    doctor_id = int(input("Enter the doctor's Id: "))
    patient_id = int(input("Enter the patient's Id: "))
    notes = input("Enter visit notes: ")
    diagnosis = input("Enter diagnosis: ")
    status = input("Enter visit status (Follow-up or Complete): ")
    visit_type_id = int(input("Enter your visit type: "))
    visit_date = input("Enter the date of the visit in format YYYY-MM-DD: ")  ## add default value in db that is to be overriden if user enters nothing?
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
        print("Medication id {} added".format(row[1]))
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
        print("Laboratory id {} added".format(row[1]))
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
        print("{} admission added".format(row[2]))

    cursor.close()
    return None


def add_lab_results(conn):
    visit_id = int(input("Enter the visit id: "))
    laboratory_test_id = int(input("Enter the laboratory test id: "))
    query = """
            select * from performs_lab_test where visit_id = %s and laboratory_test_id = %s
    """
    cursor = conn.cursor()
    cursor.execute(query, (visit_id, laboratory_test_id))
    result = cursor.fetchall()
    for row in result:
        print(' '.join(str(x) for x in row))
    confirm = int(input("Is this the correct laboratory test? Enter 1 for Yes, 0 for No: "))

    if confirm == 1:
        test_results = input("Enter the laboratory test results: ")
        performed_on = input("Enter date the test was performed on in format YYYY-MM-DD: ")
        row = cursor.callproc('add_lab_test_results', (visit_id, laboratory_test_id, test_results, performed_on, 0))
        conn.commit()
        print("{} lab result added".format(row[4]))
    cursor.close()
    return None

