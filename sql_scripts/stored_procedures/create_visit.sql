-- Stored procedure for adding a patient visit in the 'visit' table
USE `hospital`;
DROP procedure IF EXISTS `create_visit`;

USE `hospital`;
DROP procedure IF EXISTS `hospital`.`create_visit`;
;

DELIMITER $$
USE `hospital`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_visit`(
	in patient_id int,
    in doctor_id int,
    in visit_type_id int,
    in visit_date date,
    in visit_time time,
    in appointment_status varchar(50),
    in diagnosis varchar(255),
    in notes text,
    out success int
    )
    
begin
	set success = 0;
    insert into visit(diagnosis, status, visit_type_id, visit_date, visit_time, notes, patient_id, doctor_id)
    values (diagnosis, appointment_status, visit_type_id, visit_date, visit_time, notes, patient_id, doctor_id);
    set success = 1;
    
end $$

delimiter ;
    

