import pandas as pd


def get_available_beds(conn):
    func = """
        SELECT get_available_beds(%s)
    """
    ward_number = int(input("Enter the ward number: "))
    with conn.cursor() as cursor:
        cursor.execute(func, (ward_number,))
        result = cursor.fetchone()
        print(">>> {} beds available".format(result[0]))
    return None


def get_monthly_stats(conn):
    avg_monthly_patients_seen = """
        SELECT hospital.avg_monthly_patients_per_doctor(%s, %s)
    """
    avg_monthly_medications_prescribed = """
            SELECT hospital.avg_monthly_tests_per_doctor(%s, %s);
        """
    avg_monthly_lab_test = """
                SELECT hospital.avg_monthly_tests_per_doctor(%s, %s);
            """

    month = int(input("Enter the month (MM): "))
    year = int(input("Enter the year( YYYY): "))
    monthly_report = {}

    with conn.cursor() as cursor:
        cursor.execute(avg_monthly_patients_seen, (month, year))
        patients_seen = cursor.fetchone()
        monthly_report['Patients Seen'] = float(patients_seen[0])
        cursor.execute(avg_monthly_medications_prescribed, (month, year))
        meds_prescribed = cursor.fetchone()
        monthly_report['Meds Prescribed'] = float(meds_prescribed[0])
        cursor.execute(avg_monthly_lab_test, (month, year))
        lab_tests_performed = cursor.fetchone()
        monthly_report['Lab Tests Performed'] = float(lab_tests_performed[0])

    df = pd.DataFrame.from_dict(monthly_report, orient='index', columns=['Avg Per Doctor'])
    print(df)
    return None

