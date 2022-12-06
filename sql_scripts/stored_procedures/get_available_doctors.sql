USE `hospital`;
DROP procedure IF EXISTS `get_available_doctors`;

DELIMITER $$
USE `hospital`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_available_doctors`()
BEGIN

	select d.id, first_name, last_name, area_of_expertise
    from doctor d, expert_in ei, expertise e, works_on wo, time_slot ts
    where d.id = ei.doctor_id
    and ei.expertise_id = e.id
    and wo.doctor_id = d.id
    and wo.time_slot_id = ts.id
    and ts.time_slot_date > CURDATE();


END$$

DELIMITER ;