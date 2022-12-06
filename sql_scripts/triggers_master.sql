-- Trigger to update appointment status to completed upon a corresponding row is added to the visit table
USE hospital;
DROP TRIGGER IF EXISTS update_appointment_status;

delimiter $$

CREATE TRIGGER update_appointment_status AFTER INSERT ON visit
FOR EACH ROW
BEGIN
	UPDATE appointment AS a
    SET a.status = "Completed"
    WHERE a.appointment_date = NEW.visit_date AND a.appointment_time <= NEW.visit_time
		AND a.patient_id = NEW.patient_id AND a.doctor_id = NEW.doctor_id
        AND a.visit_type = NEW.visit_type_id;

END $$

delimiter ;