import pandas as pd
import warnings

warnings.simplefilter("ignore")
pd.set_option('display.max_columns', None)
# SQL Views


def view_patients_visit_summary(conn):
    patients_visits_query = """
        SELECT * FROM hospital.patient_visit_summary;
    """
    with conn.cursor() as cursor:
        cursor.execute(patients_visits_query)
        result = cursor.fetchall()
        for row in result:
            print(row)
    return None


def view_hospital_schedule(conn):
    hospital_schedule = """
        SELECT * FROM hospital.hospital_schedule;
    """
    df = pd.read_sql(hospital_schedule, conn)
    print(df)
    return None
