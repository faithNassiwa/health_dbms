-- Stored procedure for getting table of patient visits in a specified month/year grouped by department and visit type
delimiter $$
create procedure get_monthly_visits_by_month(
	in month_num int,
    in year_num int
)
begin
	select department.name as department_name,  visit_type.name as visit_type, count(visit.id)
    from visit, visit_type, doctor, department
    where visit_type.id = visit.visit_type_id
    and visit.doctor_id = doctor.id
    and doctor.department_id = department.id
    and month_num = MONTH(visit.visit_date)
    and year_num = YEAR(visit.visit_date)
    group by department.name, visit_type.name;
end $$

delimiter ;


-- Stored procedure for getting table of monthly patient visits in a specified year group by month and department
delimiter $$
create procedure get_monthly_visits_by_year(
    in year_num int
)
begin
	select MONTH(visit.visit_date) as month, department.name as department_name, count(visit.id)
    from visit, visit_type, doctor, department
    where visit_type.id = visit.visit_type_id
    and visit.doctor_id = doctor.id
    and doctor.department_id = department.id
    and year_num = YEAR(visit.visit_date)
    group by MONTH(visit.visit_date), department_name;
end $$

delimiter ;
