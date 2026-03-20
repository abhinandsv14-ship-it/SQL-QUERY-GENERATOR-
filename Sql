class SQLQueryGenerator:

    @staticmethod
    def select_query(table, columns="*", condition=None):
        query = f"SELECT {columns} FROM {table}"
        if condition:
            query += f" WHERE {condition}"
        return query + ";"

    @staticmethod
    def insert_query(table, columns, values):
        cols = ", ".join(columns)
        vals = ", ".join([f"'{v}'" for v in values])
        return f"INSERT INTO {table} ({cols}) VALUES ({vals});"

    @staticmethod
    def update_query(table, updates, condition):
        set_clause = ", ".join([f"{k}='{v}'" for k, v in updates.items()])
        return f"UPDATE {table} SET {set_clause} WHERE {condition};"

    @staticmethod
    def delete_query(table, condition):
        return f"DELETE FROM {table} WHERE {condition};"


# Example Usage
print(SQLQueryGenerator.select_query("students", "*", "marks > 80"))

print(SQLQueryGenerator.insert_query(
    "students",
    ["name", "age"],
    ["Abhinand", 20]
))

print(SQLQueryGenerator.update_query(
    "students",
    {"age": 21},
    "name='Abhinand'"
))

print(SQLQueryGenerator.delete_query(
    "students",
    "age < 18"
))
