import mysql.connector

# Connect Database
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="your_password",
    database="StudentDB"
)

cursor = conn.cursor()

# Create Table
cursor.execute("""
CREATE TABLE IF NOT EXISTS students (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT
)
""")

# Insert Data
cursor.execute(
    "INSERT INTO students VALUES (1, 'Rahul', 20)"
)

conn.commit()

# Display Data
cursor.execute("SELECT * FROM students")

for row in cursor.fetchall():
    print(row)

# Update Data
cursor.execute(
    "UPDATE students SET age = 21 WHERE id = 1"
)

# Delete Data
cursor.execute(
    "DELETE FROM students WHERE id = 1"
)

conn.commit()

conn.close()