-- Stored procedure for adding a new patient to the database. Makes inserts on patient and address tables.
USE hospital;
DROP procedure IF EXISTS add_patient;

delimiter $$ 

CREATE PROCEDURE add_patient (
	IN first_name VARCHAR(50),
    IN middle_name VARCHAR(50),
    IN last_name VARCHAR(50),
    IN phone_number DECIMAL(10, 0),
    IN date_of_birth DATE,
    IN gender VARCHAR(20),
    IN street VARCHAR(50),
    IN city VARCHAR(50),
    IN state VARCHAR(50),
    IN postal_code VARCHAR(50),
    IN country VARCHAR(50),
    OUT success INT,
    OUT patient_id INT
)
BEGIN
	SET success = 0;
	INSERT INTO address(street, city, state, postal_code, country)
    VALUES (street, city, state, postal_code, country);

	INSERT INTO patient(first_name, middle_name, last_name, phone_number, date_of_birth, gender, address_id)
    VALUES (first_name, middle_name, last_name, phone_number, date_of_birth, gender, LAST_INSERT_ID());
    SET success = 1;
	SET patient_id = LAST_INSERT_ID();
    
END $$

delimiter ;