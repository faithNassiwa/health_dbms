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