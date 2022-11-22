-- Stored procedure for getting a patients perscription information
delimiter $$ 

CREATE PROCEDURE get_patient_perscriptions (
	IN patient_id int
)
BEGIN
	SELECT v.visit_date AS perscribed_date, m.name AS medication,
		p.daily_dose AS daily_dose, p.number_of_days AS number_of_days
    FROM visit AS v, medication AS m, prescribes AS p
    WHERE v.patient_id = patient_id AND v.id = p.visit_id AND p.medication_id = m.id;
END $$

delimiter ;