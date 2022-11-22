-- Stored procedure for getting a doctors appointment information
USE hospital;
DROP procedure IF EXISTS get_doctor_appointments;

delimiter $$ 

CREATE PROCEDURE get_doctor_appointments (
	IN doctor_id INT
)
BEGIN
	SELECT a.appointment_date AS date, a.appointment_time AS time,
		p.last_name AS patient_last_name, p.first_name AS patient_first_name,
		vt.name AS visit_type, a.notes AS notes
	FROM appointment AS a, patient AS p, visit_type AS vt
    WHERE a.doctor_id = doctor_id AND p.id = a.patient_id
		AND a.visit_type = vt.id AND a.status = "upcoming";
END $$

delimiter ;
