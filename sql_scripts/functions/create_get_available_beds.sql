delimiter $$ 

CREATE FUNCTION `get_available_beds` (ward_number INT)
RETURNS INTEGER
DETERMINISTIC
BEGIN
	DECLARE available_beds INT;
    DECLARE ward_capacity INT;
    DECLARE num_admitted INT;
    
		SELECT count(*) INTO num_admitted
        FROM admits
        WHERE admits.discharge_date IS NULL AND admits.ward_number = ward_number;
        
        SELECT number_of_beds INTO ward_capacity
        FROM ward
        WHERE ward.ward_number = ward_number;
        
        set available_beds = ward_capacity - num_admitted;

RETURN available_beds;
END $$

delimiter ;