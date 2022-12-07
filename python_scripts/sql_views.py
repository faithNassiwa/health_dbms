import pandas as pd
import warnings

warnings.simplefilter("ignore")
pd.set_option('display.max_columns', None)
# SQL Views


def view_patients_visit_summary(conn):
    """
    Gets patients visit summary data from the database view and adds it in a dataframe that's printed in the commandline.
    param conn: MySQLConnection object
    return: None
    """
    patients_visits_query = """
        SELECT * FROM hospital.patient_visit_summary;
    """
    df = pd.read_sql(patients_visits_query, conn)
    print(df)
    return None


def view_hospital_schedule(conn):
    """
    Gets hospital schedule data from the database view and adds it in a dataframe that's printed in the commandline.
    param conn: MySQLConnection object
    return: None
    """
    hospital_schedule = """
        SELECT * FROM hospital.hospital_schedule;
    """
    df = pd.read_sql(hospital_schedule, conn)
    print(df)
    return None
