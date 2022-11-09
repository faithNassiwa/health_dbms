USE `hospital`;
DROP procedure IF EXISTS `insert_medication`;

USE `hospital`;
DROP procedure IF EXISTS `hospital`.`insert_medication`;

DELIMITER $$
USE `hospital`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_medication`(
in name varchar(255)
)
BEGIN

    insert into medication (name)
	values(name);

END$$

DELIMITER ;
