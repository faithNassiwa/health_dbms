import pandas as pd
import matplotlib.pyplot as plt
pd.set_option('display.max_columns', None)


def get_available_beds(conn):
    """
    Gets the number of available beds by ward and plots a bar chart visual report and dataframe printed in the
    commandline.
    param conn: MySQLConnection object
    return: None
    """
    cursor = conn.cursor()
    ward_ids, ward_names, beds_available = [], [], []
    ward_beds_available = {'Ward Name': ward_names, 'Beds Available': beds_available}
    func = """
        SELECT get_available_beds(%s)
    """
    ward_query = """
                SELECT ward_number, name FROM ward
    """

    cursor.execute(ward_query)
    for result in cursor.fetchall():
        ward_ids.append(result[0])
        ward_names.append(result[1])

    for ward_id in ward_ids:
        cursor.execute(func, (ward_id,))
        result = cursor.fetchone()
        beds_available.append(result[0])

    df = pd.DataFrame(ward_beds_available)
    print(df)
    plt.figure(figsize=(12, 9))
    plt.bar(df['Ward Name'], df['Beds Available'])
    plt.title("Beds Available Per Ward", weight='bold')
    plt.xticks(rotation=45)
    plt.show()
    return None


def get_monthly_stats(conn):
    """
    Get monthly stats from defined mysql functions and adds them in a dataframe that's printed in the commandline.
    param conn: MySQLConnection object
    return: None
    """
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
        if patients_seen[0]:
            monthly_report['Patients Seen'] = int(patients_seen[0])
        else:
            monthly_report['Patients Seen'] = 0
        cursor.execute(avg_monthly_medications_prescribed, (month, year))
        meds_prescribed = cursor.fetchone()
        if meds_prescribed[0]:
            monthly_report['Meds Prescribed'] = meds_prescribed[0]
        else:
            monthly_report['Meds Prescribed'] = 0
        cursor.execute(avg_monthly_lab_test, (month, year))
        lab_tests_performed = cursor.fetchone()
        if lab_tests_performed[0]:
            monthly_report['Lab Tests Performed'] = lab_tests_performed[0]
        else:
            monthly_report['Lab Tests Performed'] = 0

    df = pd.DataFrame.from_dict(monthly_report, orient='index', columns=['Avg Per Doctor'])
    print(df)
    return None
