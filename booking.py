import mysql.connector as connector

# Step 1: Connect to MySQL database
connection = connector.connect(
    user="root",
    password="12345",
    host="localhost",
    database="little_lemon"
)
cursor = connection.cursor()

# Step 2: Create sample tables (if not exists)
cursor.execute("""
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100),
    ContactNumber VARCHAR(15)
)
""")

cursor.execute("""
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    TotalCost FLOAT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
)
""")

# Step 3: Insert test data if tables are empty
cursor.execute("SELECT COUNT(*) FROM Customers")
if cursor.fetchone()[0] == 0:
    cursor.execute("INSERT INTO Customers (FullName, ContactNumber) VALUES (%s, %s)", ("Alice Smith", "9991112222"))
    cursor.execute("INSERT INTO Customers (FullName, ContactNumber) VALUES (%s, %s)", ("Bob Johnson", "8883334444"))
    cursor.execute("INSERT INTO Customers (FullName, ContactNumber) VALUES (%s, %s)", ("Charlie Brown", "7775556666"))

    cursor.execute("INSERT INTO Orders (CustomerID, TotalCost) VALUES (%s, %s)", (1, 45.50))
    cursor.execute("INSERT INTO Orders (CustomerID, TotalCost) VALUES (%s, %s)", (2, 75.00))
    cursor.execute("INSERT INTO Orders (CustomerID, TotalCost) VALUES (%s, %s)", (3, 120.00))

    connection.commit()

# Step 4: Show all tables
print("\n📂 Tables in 'little_lemon' database:")
cursor.execute("SHOW TABLES")
for table in cursor.fetchall():
    print(f" - {table[0]}")

# Step 5: JOIN query for customers who spent more than $60
print("\n💰 Customers who spent more than $60:")
query = """
SELECT Customers.FullName, Customers.ContactNumber, Orders.TotalCost
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.TotalCost > 60
"""
cursor.execute(query)
results = cursor.fetchall()

for row in results:
    print(f"Name: {row[0]} | Contact: {row[1]} | Bill: ${row[2]}")

# Step 6: Cleanup
cursor.close()
connection.close()
print("\n✅ Database connection closed.")
