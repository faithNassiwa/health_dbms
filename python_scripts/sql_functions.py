def get_available_beds(conn):
    func = """
        SELECT get_available_beds(%s)
    """
    ward_number = int(input("Enter the ward number: "))
    with conn.cursor() as cursor:
        cursor.execute(func, (ward_number,))
        result = cursor.fetchone()
        print(">>> {} beds available".format(result[0]))
        print('\n')

