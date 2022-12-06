import pandas as pd
import warnings

warnings.simplefilter("ignore")
pd.set_option('display.max_columns', None)
# SQL Views


def view_patients_visit_summary(conn):
    patients_visits_query = """
        SELECT * FROM hospital.patient_visit_summary;
    """
    df = pd.read_sql(patients_visits_query, conn)
    print(df)
    return None


def view_hospital_schedule(conn):
    hospital_schedule = """
        SELECT * FROM hospital.hospital_schedule;
    """
    df = pd.read_sql(hospital_schedule, conn)
    print(df)
    return None
