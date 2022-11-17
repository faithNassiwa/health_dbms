delimiter $$ 

CREATE FUNCTION `avg_patients_per_doctor` ()
RETURNS DECIMAL(5, 2)
DETERMINISTIC
BEGIN
	DECLARE average_num_patients DECIMAL(5, 2);
    
    SELECT AVG(count) INTO average_num_patients
    FROM (SELECT count(DISTINCT patient_id) AS count
		  FROM visits
          GROUP BY doctor_id) AS patients_per_doctor;

RETURN average_num_patients;
END $$

delimiter ;