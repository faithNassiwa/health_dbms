USE `hospital`;
DROP procedure IF EXISTS `get_available_doctors`;

DELIMITER $$
USE `hospital`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_available_doctors`()
BEGIN

	select d.id, d.first_name, d.last_name, e.area_of_expertise, ts.time_slot_date, ts.start_time, ts.end_time
    from doctor d, expert_in ei, expertise e, works_on wo, time_slot ts
    where d.id = ei.doctor_id
    and ei.expertise_id = e.id
    and wo.doctor_id = d.id
    and wo.time_slot_id = ts.id
    and ts.time_slot_date > CURDATE()
    order by ts.time_slot_date asc;


END$$

DELIMITER ;
