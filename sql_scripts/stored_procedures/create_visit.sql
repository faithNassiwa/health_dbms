<<<<<<< HEAD
-- Stored procedure for adding a patient visit in the 'visit' table
=======
>>>>>>> 938807b (Add visit creation)
USE `hospital`;
DROP procedure IF EXISTS `create_visit`;

USE `hospital`;
DROP procedure IF EXISTS `hospital`.`create_visit`;
;

DELIMITER $$
USE `hospital`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_visit`(
<<<<<<< Updated upstream

    in diagnosis varchar(255),
    in status varchar(50),
=======
<<<<<<< HEAD
	in patient_id int,
    in doctor_id int,
    in visit_type_id int,
>>>>>>> Stashed changes
    in visit_date date,
    in visit_time time,
    in visit_type_id int,
    in notes text,
    in patient_id int,
    in doctor_id int,
    out success int,
    out visit_id int
)
BEGIN
	set success = 0;
	insert into visit (diagnosis, status, visit_date, visit_time, visit_type_id, notes, patient_id, doctor_id)
	values ( diagnosis, status, curdate(), curtime(), visit_type_id ,notes, patient_id, doctor_id);
    set success = 1;
    set visit_id = LAST_INSERT_ID();

END $$

delimiter ;
    

=======

    in diagnosis varchar(255),
    in status varchar(50),
    in visit_date date,
    in visit_time time,
    in visit_type_id int,
    in notes text,
    in patient_id int,
    in doctor_id int,
    out success int
)
BEGIN
	set success = 0;
	insert into visit (diagnosis, status, visit_date, visit_time, visit_type_id, notes, patient_id, doctor_id)
	values ( diagnosis, status, curdate(), curtime(), visit_type_id ,notes, patient_id, doctor_id);
    set success = 1;
END$$

DELIMITER ;
>>>>>>> 938807b (Add visit creation)
