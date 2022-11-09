USE `hospital`;
DROP procedure IF EXISTS `get_all_medications`;

USE `hospital`;
DROP procedure IF EXISTS `hospital`.`get_all_medications`;

DELIMITER $$
USE `hospital`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_medications`()
BEGIN
	select name from medication;
END$$

DELIMITER ;
