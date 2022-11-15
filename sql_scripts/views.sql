-- view of visit summary
create view patient_visit_summary as
	select v.id as visit_id, vt.name as visit_type, v.visit_date, v.visit_time,
			p.first_name as patient_first_name, p.last_name as patient_last_name,
            d.first_name as doctor_first_name, d.last_name as doctor_last_name,
			v.diagnosis, v.notes
        from visit as v, visit_type as vt, patient as p, doctor as d
        where v.visit_type_id = vt.id
			and v.patient_id = p.id
            and v.doctor_id = d.id;

-- view of hospital schedule
create view hospital_schedule as
	select d.first_name, d.last_name, t.time_slot_date as date, t.start_time, t.end_time
    from doctor as d, time_slot as t, works_on
    where works_on.doctor_id = d.id
		and works_on.time_slot_id = t.id;

-- view of hospital patients
create view hospital_patients as
	select p.first_name, p.middle_name, p.last_name, p.date_of_birth, p.gender,
			w.name as ward_name, d.first_name as doctor_first_name, d.last_name as doctor_last_name,
            a.admit_date, a.admit_time
	from patient as p, ward as w, admits as a, visit as v, doctor as d
    where a.visit_id = v.id
		and v.patient_id = p.id
        and a.ward_number = w.ward_number
        and v.doctor_id = d.id
        and a.discharge_date is null;

-- view of discharged patients
create view discharged_patients as
	select p.first_name, p.middle_name, p.last_name, p.date_of_birth, p.gender,
			w.name as ward_name, d.first_name as doctor_first_name, d.last_name as doctor_last_name,
            a.admit_date, a.admit_time,
            a.discharge_date, a.discharge_time
	from patient as p, ward as w, admits as a, visit as v, doctor as d
    where a.visit_id = v.id
		and v.patient_id = p.id
        and a.ward_number = w.ward_number
        and v.doctor_id = d.id
        and a.discharge_date is not null;


        
            
        