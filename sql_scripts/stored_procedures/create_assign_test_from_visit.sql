-- Stored procedure for assigning a lab test via visit_id
USE hospital;
DROP procedure IF EXISTS assign_test_from_visit;

delimiter $$ 

CREATE PROCEDURE assign_test_from_visit (
	IN visit_id INT,
    IN laboratory_test_id INT,
    IN perform_by_date DATE,
    OUT success INT
)
BEGIN
	SET success = 0;
    INSERT INTO performs_lab_test(visit_id, laboratory_test_id, perform_by_date, test_results, performed_on)
    VALUES (visit_id, laboratory_test_id, perform_by_date, NULL, NULL);
    SET success = 1;
    
END $$

delimiter ;