-- Stored procedure for getting a patients visit information
USE hospital;
DROP procedure IF EXISTS get_patient_visits;

delimiter $$ 

CREATE PROCEDURE get_patient_visits (
	IN patient_id INT
)
BEGIN
	SELECT v.visit_date AS date, v.visit_time AS time, d.last_name AS doctor,
		vt.name AS visit_type, v.diagnosis AS diagnosis, v.notes AS notes
	FROM visit AS v, doctor AS d, visit_type AS vt
    WHERE v.patient_id = patient_id AND d.id = v.doctor_id
		AND v.visit_type_id = vt.id ORDER BY date DESC;
END $$

delimiter ;