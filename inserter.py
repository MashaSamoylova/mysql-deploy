import pymysql
import random
from pymysql.cursors import DictCursor

TYPES = ['ATTACK', 'SQL_INJECTION', 'OK']

def generate_ip():
    return \
            str(random.randint(0, 255)) + "." + \
            str(random.randint(0, 255)) + "." + \
            str(random.randint(0, 255)) + "." + \
            str(random.randint(0, 255)) 

def generate_port():
    return random.randint(0, 65535)

def fill_database():
    connection = pymysql.connect(
        host='localhost',
        port=3306,
        user='root',
        password='',
        db='firewallLogs',
        charset='utf8mb4',
        cursorclass=DictCursor
    )
    for i in range(100):
        status = TYPES[random.randint(0,2)]
        server_addr = generate_ip()
        server_port = generate_port()
        client_addr = generate_ip()
        client_port = generate_port()

        with connection.cursor() as cursor:
            query = """
            INSERT INTO logs
            (date_time, type, server_address, server_port, client_address, client_port)
            VALUES
            (NOW(), "{}", "{}", "{}", "{}", "{}");
            """.format(status, server_addr, server_port, client_addr, client_port)
            print(query)
            cursor.execute(query)
            connection.commit()

    with connection.cursor() as cursor:
        query = """
        SELECT * FROM logs
        """
        cursor.execute(query)
        for row in cursor:
            print(row)
    connection.close()

if __name__ == "__main__":
    fill_database()
