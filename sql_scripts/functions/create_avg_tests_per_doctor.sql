-- Function for getting the average number of lab tests assigned by each doctor in the given month
delimiter $$ 

CREATE FUNCTION `avg_monthly_tests_per_doctor` (month_num INT, year_num INT)
RETURNS DECIMAL(5, 2)
DETERMINISTIC
BEGIN
	DECLARE average_num_tests DECIMAL(5, 2);
    
    SELECT AVG(count) INTO average_num_tests
    FROM (SELECT count(*) AS count
		  FROM visits as v, performs_lab_test as t
          WHERE MONTH(v.visit_date) = month_num AND YEAR(v.visit_date) = year_num
          AND v.id = t.visit_id
          GROUP BY v.doctor_id) AS tests_per_doctor;

RETURN average_num_tests;
END $$

delimiter ;

-- Function for getting the average number of lab tests assigned by each doctor in the given year
delimiter $$ 

CREATE FUNCTION `avg_yearly_tests_per_doctor` (year_num INT)
RETURNS DECIMAL(5, 2)
DETERMINISTIC
BEGIN
	DECLARE average_num_tests DECIMAL(5, 2);
    
    SELECT AVG(count) INTO average_num_tests
    FROM (SELECT count(*) AS count
		  FROM visits as v, performs_lab_test as t
          WHERE YEAR(v.visit_date) = year_num
          AND v.id = t.visit_id
          GROUP BY v.doctor_id) AS tests_per_doctor;

RETURN average_num_tests;
END $$

delimiter ;