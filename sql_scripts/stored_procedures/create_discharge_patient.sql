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