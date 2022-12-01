USE `hospital`;
DROP procedure IF EXISTS `add_prescription`;

DELIMITER $$
USE `hospital`$$
CREATE PROCEDURE `add_prescription` (
	in visit_id int,
    in medication_id int,
    in daily_dose varchar(50),
    in number_of_days decimal(4,0),
    out success int
    )
BEGIN
	set success = 0;
	insert into prescribes (visit_id, medication_id, daily_dose, number_of_days)
	values (visit_id, medication_id, daily_dose, number_of_days);
    set success = 1;

END$$

DELIMITER ;