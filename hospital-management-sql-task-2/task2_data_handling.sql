-- INSERT statements
INSERT INTO Patients (patient_name, age, gender, phone_number)
VALUES
('Rahul', 30, 'Male', '9876541230'),
('Sneha', NULL, 'Female', '9876511111'),
('Arjun', 40, NULL, NULL);

-- NULL checking
SELECT * 
FROM Patients
WHERE age IS NULL;

SELECT * 
FROM Patients
WHERE phone_number IS NULL;

-- Partial insert
INSERT INTO Patients (patient_name, gender)
VALUES ('Kiran', 'Male');

-- NOT NULL constraint
ALTER TABLE Patients
ALTER COLUMN patient_name SET NOT NULL;

-- UPDATE single row
UPDATE Patients
SET age = 26
WHERE patient_name = 'Sneha';

-- UPDATE multiple rows
UPDATE Patients
SET gender = 'Updated'
WHERE age > 30;

-- DELETE
DELETE FROM Patients
WHERE patient_name = 'Kiran';

-- Insert specific columns
INSERT INTO Doctors (doctor_name, specialization)
VALUES ('Dr. Sharma', 'Dermatology');

-- Insert using SELECT
CREATE TABLE Department_Backup (
    department_id INT,
    department_name VARCHAR(100)
);

INSERT INTO Department_Backup
SELECT * FROM Departments;