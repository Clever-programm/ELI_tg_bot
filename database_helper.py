import sqlite3 as sql


class DBSelectExcept(Exception):
    pass


class DBInsertExcept(Exception):
    pass


con = sql.connect('data/databases/school_data.sql')
cur = con.cursor()


def selector(obj: str, table: str, conditions: list) -> str:
    if not (ans := cur.execute(f"""SELECT {obj} FROM {table} 
                                        WHERE {' AND '.join(conditions)}""")):
        raise DBSelectExcept

    return str(ans)


def inserter(table: str, columns: list, values: list) -> None:
    if len(columns) != len(values):
        raise DBInsertExcept

    if not (cur.execute(f"""SELECT id FROM {table} 
                                        WHERE {columns[0]} = {values[0]}""")):
        raise DBInsertExcept

    cur.execute(f"""INSERT INTO {table} ({', '.join(columns)}) 
                                VALUES ({', '.join(values)})""")
