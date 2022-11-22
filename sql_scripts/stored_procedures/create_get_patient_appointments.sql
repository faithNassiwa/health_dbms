-- Stored procedure for getting a patients appointment information
USE hospital;
DROP procedure IF EXISTS get_patient_appointments;

delimiter $$ 

CREATE PROCEDURE get_patient_appointments (
	IN patient_id INT
)
BEGIN
	SELECT a.appointment_date AS date, a.appointment_time AS time, d.last_name AS doctor,
		vt.name AS visit_type, a.notes AS notes
	FROM appointment AS a, doctor AS d, visit_type AS vt
    WHERE a.patient_id = patient_id AND d.id = a.doctor_id
		AND a.visit_type = vt.id AND a.status = "upcoming";
END $$

delimiter ;
