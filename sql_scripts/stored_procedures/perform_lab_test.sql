USE `hospital`;
DROP procedure IF EXISTS `perform_lab_test`;

DELIMITER $$
USE `hospital`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `perform_lab_test`(
		visit_id int,
        laboratory_test_id int,
        perform_by_date date,
        out success int
        )
BEGIN
	set success = 0;
	insert into performs_lab_test (visit_id,laboratory_test_id, perform_by_date)
	values ( visit_id,laboratory_test_id, perform_by_date);
    set success = 1;
END$$

DELIMITER ;