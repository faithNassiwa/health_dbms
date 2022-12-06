-- Function for getting the average number of patients seen by each doctor in the given month
delimiter $$

CREATE FUNCTION `avg_monthly_patients_per_doctor` (month_num INT, year_num INT)
RETURNS DECIMAL(5, 2)
DETERMINISTIC
BEGIN
	DECLARE average_num_patients DECIMAL(5, 2);

    SELECT AVG(count) INTO average_num_patients
    FROM (SELECT count(DISTINCT patient_id) AS count
		  FROM visit
          WHERE MONTH(visit_date) = month_num AND YEAR(visit_date) = year_num
          GROUP BY doctor_id) AS patients_per_doctor;

RETURN average_num_patients;
END $$

delimiter ;

-- Function for getting the average number of prescriptions prescribed by each doctor in the given month
delimiter $$

CREATE FUNCTION `avg_monthly_perscriptions_per_doctor` (month_num INT, year_num INT)
RETURNS DECIMAL(5, 2)
DETERMINISTIC
BEGIN
	DECLARE average_num_perscriptions DECIMAL(5, 2);

    SELECT AVG(count) INTO average_num_perscriptions
    FROM (SELECT count(*) AS count
		  FROM visit as v, prescribes as p
          WHERE MONTH(v.visit_date) = month_num AND YEAR(v.visit_date) = year_num
          AND v.id = p.visit_id
          GROUP BY v.doctor_id) AS perscriptions_per_doctor;

RETURN average_num_perscriptions;
END $$

delimiter ;

-- Function for getting the average number of lab tests assigned by each doctor in the given month
delimiter $$

CREATE FUNCTION `avg_monthly_tests_per_doctor` (month_num INT, year_num INT)
RETURNS DECIMAL(5, 2)
DETERMINISTIC
BEGIN
	DECLARE average_num_tests DECIMAL(5, 2);

    SELECT AVG(count) INTO average_num_tests
    FROM (SELECT count(*) AS count
		  FROM visit as v, performs_lab_test as t
          WHERE MONTH(v.visit_date) = month_num AND YEAR(v.visit_date) = year_num
          AND v.id = t.visit_id
          GROUP BY v.doctor_id) AS tests_per_doctor;

RETURN average_num_tests;
END $$

delimiter ;

-- Function to get the available beds
delimiter $$

CREATE FUNCTION `get_available_beds` (ward_number INT)
RETURNS INTEGER
DETERMINISTIC
BEGIN
	DECLARE available_beds INT;
    DECLARE ward_capacity INT;
    DECLARE num_admitted INT;

		SELECT count(*) INTO num_admitted
        FROM admits
        WHERE admits.discharge_date IS NULL AND admits.ward_number = ward_number;

        SELECT number_of_beds INTO ward_capacity
        FROM ward
        WHERE ward.ward_number = ward_number;

        set available_beds = ward_capacity - num_admitted;

RETURN available_beds;
END $$

delimiter ;