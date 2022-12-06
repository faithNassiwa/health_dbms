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