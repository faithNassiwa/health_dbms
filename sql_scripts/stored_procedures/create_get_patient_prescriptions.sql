-- Stored procedure for getting a patients prescription information
USE hospital;
DROP procedure IF EXISTS get_patient_prescriptions;

delimiter $$ 

CREATE PROCEDURE get_patient_prescriptions (
	IN patient_id int
)
BEGIN
	SELECT v.visit_date AS prescribed_date, m.name AS medication,
		p.daily_dose AS daily_dose, p.number_of_days AS number_of_days
    FROM visit AS v, medication AS m, prescribes AS p
    WHERE v.patient_id = patient_id AND v.id = p.visit_id AND p.medication_id = m.id;
END $$

delimiter ;