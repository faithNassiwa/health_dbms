-- Stored Procedure for getting table of the count of prescribed meds in a specified month/year grouped by medication
delimiter $$
create procedure get_meds_monthly_prescibes(
	in month_num int,
    in year_num int
)
begin
	select m.id, m.name as medication, count(m.id)
	from medication as m, visit as v, prescribes as p
    where m.id = p.medication_id
    and v.id = p.visit_id
    and month_num = MONTH(v.visit_date)
    and year_num = YEAR(v.visit_date)
    group by m.id;
end $$

delimiter ;

-- Stored procedure for getting table of count of prescribed meds in a specified month/year grouped by doctor
delimiter $$
create procedure get_doctor_monthly_prescibes(
	in month_num int,
    in year_num int
)
begin
	select d.id as doctor_id, d.first_name as doctor_first_name, d.last_name as doctor_last_name,
		count(m.id)
	from medication as m, doctor as d, visit as v, prescribes as p
    where m.id = p.medication_id
    and d.id = v.doctor_id
    and v.id = p.visit_id
    and month_num = MONTH(v.visit_date)
    and year_nget_doctor_monthly_prescibesum = YEAR(v.visit_date)
	group by d.id;
end $$

delimiter ;

-- Stored procedure for gettingStored procedure for geting table of count of prescribed meds in a specified month/year grouped by doctor and medication
delimiter $$
create procedure get_doc_med_monthly_prescibes(
	in month_num int,
    in year_num int
)
begin
    select 
			d.id as doctor_id, d.first_name as doctor_first_name, d.last_name as doctor_last_name,
            m.id, m.name as medication, count(m.id)
	from medication as m, doctor as d, visit as v, prescribes as p
    where m.id = p.medication_id
    and d.id = v.doctor_id
    and v.id = p.visit_id
    and month_num = MONTH(v.visit_date)
    and year_num = YEAR(v.visit_date)
    group by d.id, m.id;
end $$

delimiter ;