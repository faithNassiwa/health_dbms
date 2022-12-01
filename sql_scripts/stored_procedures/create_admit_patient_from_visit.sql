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
    IF get_available_beds(ward_number) > 0 THEN
		INSERT INTO admits
		VALUES (visit_id, ward_number, CURDATE(), CURTIME(), NULL, NULL);
        
		SET success = 1;
    END IF;
    
END $$

delimiter ;