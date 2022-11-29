-- Stored procedure for getting visit summaries of a doctor
delimiter $$
create procedure get_doctor_visits(
	in doctor_id_num int
)
begin
	select v.id as visit_id, vt.name as visit_type, v.visit_date, v.visit_time, v.status,
			p.id patient_id, p.first_name as patient_first_name, p.last_name as patient_last_name,
            d.first_name as doctor_first_name, d.last_name as doctor_last_name,
			v.diagnosis, v.notes
        from visit as v, visit_type as vt, patient as p, doctor as d
        where v.visit_type_id = vt.id
			and v.patient_id = p.id
            and v.doctor_id = d.id
            and v.doctor_id = doctor_id_num;
end $$

delimiter ;