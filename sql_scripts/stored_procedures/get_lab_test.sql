-- Stored procedure for getting table of lab tests performed in a specified month/year
delimiter $$
create procedure get_monthly_lab_test(
	in month_num int,
    in year_num int
)
begin
	select laboratory_test_id, name, count(*)
    from performs_lab_test, laboratory_test
    where month_num = MONTH(performed_on)
    and year_num = YEAR(performed_on)
    and performs_lab_test.laboratory_test_id = laboratory_test.id
    group by id;
    end $$
    
delimiter ;
    