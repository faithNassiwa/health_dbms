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