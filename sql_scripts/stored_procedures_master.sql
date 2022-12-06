-- Insert Stored Procedures --
-- Stored procedure for adding a new patient to the database. Inserts a row in patient and address tables.
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

-- Stored procedure for adding a patient visit in the 'visit' table
USE `hospital`;
DROP procedure IF EXISTS `hospital`.`create_visit`;

DELIMITER $$
USE `hospital`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_visit`(

    in diagnosis varchar(255),
    in status varchar(50),
    in visit_date date,
    in visit_time time,
    in visit_type_id int,
    in notes text,
    in patient_id int,
    in doctor_id int,
    out success int,
    out visit_id int
)
BEGIN
	set success = 0;
	insert into visit (diagnosis, status, visit_date, visit_time, visit_type_id, notes, patient_id, doctor_id)
	values ( diagnosis, status, curdate(), curtime(), visit_type_id ,notes, patient_id, doctor_id);
    set success = 1;
    set visit_id = LAST_INSERT_ID();
END $$

delimiter ;

-- Stored Procedure to create a prescription, inserts a row un the prescribes table
USE `hospital`;
DROP procedure IF EXISTS `add_prescription`;

DELIMITER $$
USE `hospital`$$
CREATE PROCEDURE `add_prescription` (
	in visit_id int,
    in medication_id int,
    in daily_dose varchar(50),
    in number_of_days decimal(4,0),
    out success int
    )
BEGIN
	set success = 0;
	insert into prescribes (visit_id, medication_id, daily_dose, number_of_days)
	values (visit_id, medication_id, daily_dose, number_of_days);
    set success = 1;

END$$

DELIMITER ;

-- Stored procedure adding results and performed date to a lab test via visit_id and laboratory_test_id
USE hospital;
DROP procedure IF EXISTS add_lab_test_results;

delimiter $$

CREATE PROCEDURE add_lab_test_results (
	IN visit_id INT,
    IN laboratory_test_id INT,
    IN test_results VARCHAR(50),
    IN performed_on DATE,
    OUT success INT
)
BEGIN
	SET success = 0;

    UPDATE performs_lab_test AS p
    SET p.test_results = test_results, p.performed_on = performed_on
    WHERE p.visit_id = visit_id AND p.laboratory_test_id = laboratory_test_id;

    SET success = 1;

END $$

delimiter ;

-- Stored procedure for admitting a patient to a ward via visit_id
USE hospital;
DROP procedure IF EXISTS admit_patient_from_visit;

delimiter $$

CREATE PROCEDURE admit_patient_from_visit (
	IN visit_id INT,
    IN ward_number INT,
    OUT success INT
)
BEGIN
	SET success = 0;
    IF NOT EXISTS (SELECT *
				   FROM admits a
				   WHERE a.visit_id = visit_id
				   AND a.admit_date IS NULL AND a.admit_time IS NULL)
    AND get_available_beds(ward_number) > 0 THEN
		INSERT INTO admits
		VALUES (visit_id, ward_number, CURDATE(), CURTIME(), NULL, NULL);

		SET success = 1;
    END IF;

END $$

delimiter ;

-- Stored Procedure to create an appointment, inserts a row in the appointments table
USE `hospital`;
DROP procedure IF EXISTS `create_appointment`;

DELIMITER $$
USE `hospital`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_appointment`(
	in patient_id int,
    in doctor_id int,
    in appointment_date date,
    in appointment_time time,
    in visit_type int,
    in notes text,
    out success int

)
BEGIN
	set success = 0;
	insert into appointment (patient_id, doctor_id, appointment_date, appointment_time, visit_type, status, notes)
	values ( patient_id, doctor_id, appointment_date, appointment_time, visit_type, 'New', notes);
    set success = 1;

END$$

DELIMITER ;

-- Stored Procedure to insert medication name in the medication table
USE `hospital`;
DROP procedure IF EXISTS `insert_medication`;

DELIMITER $$
USE `hospital`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_medication`(
in name varchar(255)
)
BEGIN

    insert into medication (name)
	values(name);

END$$

DELIMITER ;

-- Stored Procedure to insert a lab test in the perform_lab_test table
USE `hospital`;
DROP procedure IF EXISTS `perform_lab_test`;

DELIMITER $$
USE `hospital`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `perform_lab_test`(
		visit_id int,
        laboratory_test_id int,
        perform_by_date date,
        out success int
        )
BEGIN
	set success = 0;
	insert into performs_lab_test (visit_id,laboratory_test_id, perform_by_date)
	values ( visit_id,laboratory_test_id, perform_by_date);
    set success = 1;
END$$

DELIMITER ;

-- Update Stored Procedures
-- Stored Procedure to Confirm an appointment
USE `hospital`;
DROP procedure IF EXISTS `hospital`.`confirm_appointment`;
;

DELIMITER $$
USE `hospital`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `confirm_appointment`(
		IN appointment_id INT,
        OUT success INT
)
BEGIN
	DECLARE appointment_status VARCHAR(50);
	SET success = 0;

    SELECT a.status INTO appointment_status
    FROM appointment a
    WHERE a.id = appointment_id;

	IF LOWER(appointment_status) = 'New' THEN
		UPDATE appointment
        SET status = 'upcoming'
		WHERE id = appointment_id;
		SET success = 1;
	END IF;
END$$

DELIMITER ;

-- Stored procedure for discharging an admitted patient
USE hospital;
DROP PROCEDURE IF EXISTS discharge_patient;

delimiter $$

CREATE PROCEDURE discharge_patient (
	IN patient_id INT,
    OUT success INT
)
BEGIN
	DECLARE admits_visit_id INT;
    DECLARE admits_ward_number INT;
	SET success = 0;

    SELECT a.visit_id, a.ward_number INTO admits_visit_id, admits_ward_number
    FROM visit v, admits a
    WHERE v.patient_id = patient_id AND v.id = a.visit_id
		AND a.discharge_date IS NULL AND a.discharge_time IS NULL;

    IF admits_visit_id IS NOT NULL AND admits_ward_number IS NOT NULL THEN
		UPDATE admits a
		SET a.discharge_date = CURDATE(), a.discharge_time = CURTIME()
		WHERE a.visit_id = admits_visit_id AND a.ward_number = admits_ward_number;

        SET success = 1;
	END IF;

END $$

delimiter ;

-- Delete Stored Procedures
-- Stored procedure for cancelling an upcoming appointment
USE hospital;
DROP procedure IF EXISTS cancel_appointment;

delimiter $$

CREATE PROCEDURE cancel_appointment (
	IN appointment_id INT,
    OUT success INT
)
BEGIN
	DECLARE appointment_status VARCHAR(50);
	SET success = 0;

    SELECT a.status INTO appointment_status
    FROM appointment a
    WHERE a.id = appointment_id;

	IF LOWER(appointment_status) in ('upcoming', 'New') THEN
		DELETE FROM appointment
		WHERE id = appointment_id;
		SET success = 1;
	END IF;

END $$

delimiter ;

-- View Data Stored Procedures
-- Stored procedure for getting a patients visit information
USE hospital;
DROP procedure IF EXISTS get_patient_visits;

delimiter $$

CREATE PROCEDURE get_patient_visits (
	IN patient_id INT
)
BEGIN
	SELECT v.visit_date AS date, v.visit_time AS time, d.last_name AS doctor,
		vt.name AS visit_type, v.diagnosis AS diagnosis, v.notes AS notes
	FROM visit AS v, doctor AS d, visit_type AS vt
    WHERE v.patient_id = patient_id AND d.id = v.doctor_id
		AND v.visit_type_id = vt.id ORDER BY date DESC;
END $$

delimiter ;

-- Stored procedure for getting a patients prescription information
USE hospital;
DROP procedure IF EXISTS get_patient_prescriptions;

delimiter $$

CREATE PROCEDURE get_patient_prescriptions (
	IN patient_id int
)
BEGIN
	SELECT v.visit_date AS prescribed_date, m.name AS medication,
		p.daily_dose AS daily_dose, p.number_of_days AS number_of_days
    FROM visit AS v, medication AS m, prescribes AS p
    WHERE v.patient_id = patient_id AND v.id = p.visit_id AND p.medication_id = m.id ORDER BY prescribed_date DESC;
END $$

delimiter ;

-- Stored Procedure to get available doctors by checking if they have timeslots in the future
USE `hospital`;
DROP procedure IF EXISTS `get_available_doctors`;

DELIMITER $$
USE `hospital`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_available_doctors`()
BEGIN

	select d.id, d.first_name, d.last_name, e.area_of_expertise, ts.time_slot_date, ts.start_time, ts.end_time
    from doctor d, expert_in ei, expertise e, works_on wo, time_slot ts
    where d.id = ei.doctor_id
    and ei.expertise_id = e.id
    and wo.doctor_id = d.id
    and wo.time_slot_id = ts.id
    and ts.time_slot_date > CURDATE()
    order by ts.time_slot_date asc;


END$$

DELIMITER ;

-- Stored procedure to get patients lab results
USE `hospital`;
DROP procedure IF EXISTS `hospital`.`get_patient_lab_results`;

DELIMITER $$
USE `hospital`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_patient_lab_results`(
IN patient_id INT
)
BEGIN
    SElECT l.name as 'Lab Test', v.visit_date AS 'Test Taken On', plt.test_results As 'Lab Results', plt.performed_on As 'Result Date'
    FROM laboratory_test l, performs_lab_test plt, visit v
    WHERE l.id = plt.laboratory_test_id AND plt.visit_id = v.id AND v.patient_id = patient_id ORDER BY 'Test Taken On' DESC;
END$$

DELIMITER ;

-- Stored procedure to get all medications from medication table
USE `hospital`;
DROP procedure IF EXISTS `get_all_medications`;

DELIMITER $$
USE `hospital`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_medications`()
BEGIN
	select name from medication;
END$$

DELIMITER ;