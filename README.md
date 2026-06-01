# 🏥 Hospital Management SQL – Task 2

## 📌 Elevate Labs SQL Developer Internship – Task 2

This project was completed as part of the **Elevate Labs SQL Developer Internship – Task 2: Data Insertion and Handling Nulls**.

This task focused on practicing **DML (Data Manipulation Language)** operations such as inserting, updating, deleting records, and handling missing values (`NULL`) in a relational database.

The database schema created in **Task 1 (Database Setup and Schema Design)** was reused for this task to continue working with a structured Hospital Management System.

---

# 🎯 Objective

The main objective of this task was to:

- Practice inserting records using SQL
- Handle missing values using `NULL`
- Understand `NOT NULL` constraints
- Update existing records using `UPDATE`
- Delete records using `DELETE`
- Learn partial insertions
- Understand rollback concepts
- Practice data consistency and integrity

Task deliverables included creating SQL statements for:

- `INSERT`
- `UPDATE`
- `DELETE`
- Null handling

as part of SQL data manipulation learning.

---

# 🏥 Project Overview

This project uses a **Hospital Management Database System** developed in PostgreSQL using **pgAdmin 4**.

The database contains the following entities:

- Patients
- Doctors
- Departments
- Appointments

The schema was designed in Task 1 and reused in Task 2 to perform real-world database operations and practice SQL data handling techniques.

---

# 🛠 Tools Used

- PostgreSQL
- pgAdmin 4
- SQL (DML)
- GitHub

---

# 🗂 Existing Database Schema Used

The following tables from Task 1 were reused:

## 1. Patients Table

Stores patient-related information.

Columns:
- patient_id
- patient_name
- age
- gender
- phone_number

---

## 2. Doctors Table

Stores doctor-related information.

Columns:
- doctor_id
- doctor_name
- specialization
- phone_number

---

## 3. Departments Table

Stores hospital department information.

Columns:
- department_id
- department_name

---

## 4. Appointments Table

Stores appointment information.

Columns:
- appointment_id
- patient_id
- doctor_id
- appointment_date
- department_id

---

# ⚙️ Step-by-Step Process Followed

## Step 1: Verified Existing Data

Before starting Task 2, existing records from Task 1 were verified using:

```sql
SELECT * FROM Patients;
SELECT * FROM Doctors;
SELECT * FROM Departments;
SELECT * FROM Appointments;
```

This ensured the database schema and existing records were available for data manipulation.

---

## Step 2: Inserted New Records

New patient records were inserted into the database using:

```sql
INSERT INTO Patients
(patient_name, age, gender, phone_number)
VALUES
('Rahul', 30, 'Male', '9876541230'),
('Sneha', NULL, 'Female', '9876511111'),
('Arjun', 40, NULL, NULL);
```

### What was learned

- How to insert records into a table
- How to insert multiple rows at once
- Handling missing values using `NULL`

---

## Step 3: Handling NULL Values

`NULL` values were intentionally introduced to simulate missing or unknown information.

Examples:

- Sneha → age unknown
- Arjun → gender and phone number unknown

To identify missing values:

```sql
SELECT *
FROM Patients
WHERE age IS NULL;
```

```sql
SELECT *
FROM Patients
WHERE phone_number IS NULL;
```

### What was learned

- Difference between `NULL` and `0`
- How `IS NULL` works
- Why `WHERE age = NULL` is incorrect

---

## Step 4: Partial Column Insertion

Specific columns were inserted without filling every field.

Example:

```sql
INSERT INTO Patients (patient_name, gender)
VALUES ('Kiran', 'Male');
```

### What was learned

- Values can be inserted into selected columns only
- Remaining columns automatically become `NULL`

---

## Step 5: Understanding NOT NULL Constraint

The `patient_name` column was modified to enforce mandatory data entry.

```sql
ALTER TABLE Patients
ALTER COLUMN patient_name SET NOT NULL;
```

A test insertion was performed:

```sql
INSERT INTO Patients (age, gender)
VALUES (25, 'Female');
```

This produced an error because:

```text
patient_name
```

cannot contain `NULL`.

### What was learned

Difference between:

```text
NULL
```

and

```text
NOT NULL
```

---

## Step 6: Updating Existing Records

### Updating a single row

Example:

```sql
UPDATE Patients
SET age = 26
WHERE patient_name = 'Sneha';
```

### Updating multiple rows

Example:

```sql
UPDATE Patients
SET gender = 'Updated'
WHERE age > 30;
```

### What was learned

- Updating one record using `WHERE`
- Updating multiple rows using conditions
- Importance of `WHERE` clause

Without `WHERE`, all rows get updated.

---

## Step 7: Deleting Records

Example:

```sql
DELETE FROM Patients
WHERE patient_name = 'Kiran';
```

### What was learned

- How to remove records
- Importance of `WHERE` in deletion
- Risks of deleting all rows accidentally

---

## Step 8: Rollback Concept

A deletion was tested inside a transaction.

```sql
BEGIN;

DELETE FROM Patients
WHERE patient_name = 'Rahul';

ROLLBACK;
```

### What was learned

- `ROLLBACK` helps undo changes
- Difference between temporary and permanent modifications
- Purpose of transactions

---

## Step 9: Insert Using SELECT

A backup table was created.

```sql
CREATE TABLE Department_Backup (
department_id INT,
department_name VARCHAR(100)
);
```

Then data was copied:

```sql
INSERT INTO Department_Backup
SELECT * FROM Departments;
```

### What was learned

- Copying data from one table to another
- Using `INSERT INTO ... SELECT`

---

# 🧠 Key Concepts Learned

- DML (Data Manipulation Language)
- INSERT Statement
- UPDATE Statement
- DELETE Statement
- NULL Handling
- IS NULL
- NOT NULL Constraint
- Partial Insert
- Transactions
- ROLLBACK
- Data Integrity
- Conditional Updates

---

# ❓ Interview Questions and Answers

## 1. Difference between NULL and 0?

`NULL` means unknown or missing value.

`0` is an actual numeric value.

---

## 2. What is a default constraint?

A default constraint automatically assigns a value if none is provided.

Example:

```sql
status VARCHAR(20) DEFAULT 'Pending'
```

---

## 3. How does IS NULL work?

`IS NULL` checks whether a column contains missing values.

Example:

```sql
SELECT *
FROM Patients
WHERE age IS NULL;
```

---

## 4. How do you update multiple rows?

Using `UPDATE` with a condition.

Example:

```sql
UPDATE Patients
SET gender = 'Updated'
WHERE age > 30;
```

---

## 5. Can we insert partial values?

Yes.

Example:

```sql
INSERT INTO Patients (patient_name, gender)
VALUES ('Kiran', 'Male');
```

---

## 6. What happens if a NOT NULL field is left empty?

An error occurs and insertion fails.

---

## 7. How do you rollback a deletion?

Using:

```sql
ROLLBACK;
```

inside a transaction.

---

## 8. Can we insert values into specific columns only?

Yes.

By specifying column names.

---

## 9. How to insert values using SELECT?

Example:

```sql
INSERT INTO Department_Backup
SELECT * FROM Departments;
```

---

## 10. What is ON DELETE CASCADE?

It automatically deletes child records when a parent row is deleted.

---

# 🚧 Challenges Faced and Solutions

## 1. NULL vs NOT NULL Understanding

### Problem

Confusion between nullable and mandatory fields.

### Solution

Used:

```sql
ALTER TABLE Patients
ALTER COLUMN patient_name SET NOT NULL;
```

to understand constraint behavior.

---

## 2. Syntax Error in pgAdmin

### Problem

Tried using:

```sql
\d Patients
```

which caused syntax error.

### Reason

`\d` works in PostgreSQL terminal (`psql`) and not in pgAdmin Query Tool.

### Solution

Used:

```sql
SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'patients';
```

---

## 3. Deletion Confusion

### Problem

Deletion query ran successfully but data still appeared.

### Solution

Verified records using:

```sql
SELECT *
FROM Patients
WHERE patient_name = 'Kiran';
```

and rechecked database state.

---

## 4. Safe Updates and Deletes

### Problem

Risk of modifying or deleting all rows accidentally.

### Solution

Used:

```sql
WHERE
```

conditions in every update and delete query.

---

# 📂 Project Structure

```text
hospital-management-sql-task-2/
│── task2_data_handling.sql
│── README.md
```

---

# ✅ Outcome

Successfully practiced SQL DML operations by inserting, updating, deleting, and handling missing values in a Hospital Management Database System.

This task improved understanding of:

- SQL data manipulation
- Data consistency
- Transactions
- Null handling
- Safe database operations

---

## 👩‍💻 Author

**Yaswinipriya Sesetti**

LinkedIn:  
https://www.linkedin.com/in/sesetti-yaswini-priya-95811925a
