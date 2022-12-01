-- Stored procedure for prescribing a medication via visit_id
USE hospital;
DROP procedure IF EXISTS prescribe_from_visit;

delimiter $$ 

CREATE PROCEDURE prescribe_from_visit (
	IN visit_id INT,
    IN medication_id INT,
    IN daily_dose VARCHAR(50),
    IN number_of_days DECIMAL(4, 0),
    OUT success INT
)
BEGIN
	SET success = 0;
    INSERT INTO prescribes(visit_id, medication_id, daily_dose, number_of_days)
    VALUES (visit_id, medication_id, daily_dose, number_of_days);
    SET success = 1;
    
END $$

delimiter ;