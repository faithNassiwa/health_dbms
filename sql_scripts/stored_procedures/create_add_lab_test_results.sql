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