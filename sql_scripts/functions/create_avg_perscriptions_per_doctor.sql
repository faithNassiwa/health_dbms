-- Function for getting the average number of perscriptions perscribed by each doctor in the given month
delimiter $$ 

CREATE FUNCTION `avg_monthly_perscriptions_per_doctor` (month_num INT, year_num INT)
RETURNS DECIMAL(5, 2)
DETERMINISTIC
BEGIN
	DECLARE average_num_perscriptions DECIMAL(5, 2);
    
    SELECT AVG(count) INTO average_num_perscriptions
    FROM (SELECT count(*) AS count
		  FROM visits as v, perscribes as p
          WHERE MONTH(v.visit_date) = month_num AND YEAR(v.visit_date)
          AND v.id = p.visit_id
          GROUP BY v.doctor_id) AS perscriptions_per_doctor;

RETURN average_num_perscriptions;
END $$

delimiter ;

-- Function for getting the average number of perscriptions perscribed by each doctor in the given year
delimiter $$ 

CREATE FUNCTION `avg_yearly_perscriptions_per_doctor` (year_num INT)
RETURNS DECIMAL(5, 2)
DETERMINISTIC
BEGIN
	DECLARE average_num_perscriptions DECIMAL(5, 2);
    
    SELECT AVG(count) INTO average_num_perscriptions
    FROM (SELECT count(*) AS count
		  FROM visits as v, perscribes as p
          WHERE YEAR(v.visit_date) = year_num
          AND v.id = p.visit_id
          GROUP BY v.doctor_id) AS perscriptions_per_doctor;

RETURN average_num_perscriptions;
END $$

delimiter ;