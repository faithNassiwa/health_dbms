-- Function for getting the average number of patients seen by each doctor in the given month
delimiter $$ 

CREATE FUNCTION `avg_monthly_patients_per_doctor` (month_num INT, year_num INT)
RETURNS DECIMAL(5, 2)
DETERMINISTIC
BEGIN
	DECLARE average_num_patients DECIMAL(5, 2);
    
    SELECT AVG(count) INTO average_num_patients
    FROM (SELECT count(DISTINCT patient_id) AS count
		  FROM visits
          WHERE MONTH(visit_date) = month_num AND YEAR(visit_date) = year_num
          GROUP BY doctor_id) AS patients_per_doctor;

RETURN average_num_patients;
END $$

delimiter ;


-- Function for getting the average number of patients seen by each doctor in the given year
delimiter $$ 

CREATE FUNCTION `avg_yearly_patients_per_doctor` (year_num INT)
RETURNS DECIMAL(5, 2)
DETERMINISTIC
BEGIN
	DECLARE average_num_patients DECIMAL(5, 2);
    
    SELECT AVG(count) INTO average_num_patients
    FROM (SELECT count(DISTINCT patient_id) AS count
		  FROM visits
          WHERE YEAR(visit_date) = year_num
          GROUP BY doctor_id) AS patients_per_doctor;

RETURN average_num_patients;
END $$

delimiter ;
