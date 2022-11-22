def get_appointment_param(conn):
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
        appointment_time = input("Enter the date of the appointment in format HH:MI: ")
        visit_type = int(input("Enter your visit type"))
        notes = input("Enter any follow-up notes: ")
        cursor.close()
    else:
        print("No available timeslots")
        print("\n")
    return [patient_id, doctor_id, appointment_date, appointment_time, visit_type, notes, 0]


def create_appointment(conn):
    args = get_appointment_param(conn=conn)
    cursor = conn.cursor()
    row = cursor.callproc('create_appointment', tuple(args))
    conn.commit()
    result = row[6]
    cursor.close()
    print("{} appointment request made, someone will contact with further instructions.".format(result))
    print("\n")
