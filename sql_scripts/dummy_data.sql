insert into address(street, city, state, postal_code, country) values ('100 Massachusetts Avenue', 'Boston', 'Massachusetts', '02115', 'USA');
insert into address(street, city, state, postal_code, country) values ('200 Massachusetts Avenue', 'Boston', 'Massachusetts', '02115', 'USA');
insert into address(street, city, state, postal_code, country) values ('300 Massachusetts Avenue', 'Boston', 'Massachusetts', '02115', 'USA');
insert into address(street, city, state, postal_code, country) values ('400 Massachusetts Avenue', 'Boston', 'Massachusetts', '02115', 'USA');
insert into address(street, city, state, postal_code, country) values ('500 Massachusetts Avenue', 'Boston', 'Massachusetts', '02115', 'USA');
insert into address(street, city, state, postal_code, country) values ('600 Massachusetts Avenue', 'Boston', 'Massachusetts', '02115', 'USA');

insert into department(name) values ('Oncology');
insert into department(name) values ('Pediatrics');
insert into department(name) values ('Cardiology');
insert into department(name) values ('Intensive Care Unit');
insert into department(name) values ('Emergency/Casualty');

insert into doctor(first_name, middle_name, last_name, phone_number, date_of_birth, gender, license_no, address_id, department_id) values ('Michael', 'Gary', 'Scott', 6178675309, '1965-03-15', 'Male', '0000000001', 1, 1);
insert into doctor(first_name, middle_name, last_name, phone_number, date_of_birth, gender, license_no, address_id, department_id) values ('Hugh', null, 'Laurie', 5088675309, '1959-06-11', 'Male', '0000000002', 2, 2);
insert into doctor(first_name, middle_name, last_name, phone_number, date_of_birth, gender, license_no, address_id, department_id) values ('Ann', null, 'Chovie', 4138675309, '1999-09-22', 'Female', '0000000003', 2, 3);


insert into patient(first_name, middle_name, last_name, phone_number, date_of_birth, gender, address_id) values ('Pippi', null, 'Longstocking', 7818675309, '1945-05-30', 'Female', 3);
insert into patient(first_name, middle_name, last_name, phone_number, date_of_birth, gender, address_id) values ('Carl', 'Edward', 'Sagan', 3398675309, '1934-11-09', 'Male', 4);
insert into patient(first_name, middle_name, last_name, phone_number, date_of_birth, gender, address_id) values ('Tom', null, 'Ato', 3518675309, '1980-04-21', 'Male', 4);

insert into expertise(area_of_expertise) values ('Breast Cancer');
insert into expertise(area_of_expertise) values ('Child Development');
insert into expertise(area_of_expertise) values ('Coronary Artery Bypass Grafting');
insert into expertise(area_of_expertise) values ('Trauma');
insert into expertise(area_of_expertise) values ('Internal Medicine');

insert into expert_in(doctor_id, expertise_id) values (1,1);
insert into expert_in(doctor_id, expertise_id) values (1,5);
insert into expert_in(doctor_id, expertise_id) values (2,1);
insert into expert_in(doctor_id, expertise_id) values (2,2);
insert into expert_in(doctor_id, expertise_id) values (2,3);
insert into expert_in(doctor_id, expertise_id) values (2,4);
insert into expert_in(doctor_id, expertise_id) values (2,5);

insert into visit_type(name) values ('Physical Examination');
insert into visit_type(name) values ('Oncology Appointment');
insert into visit_type(name) values ('Cardiology Appointment');
insert into visit_type(name) values ('Emergency Room Visit');

insert into visit(diagnosis, status, visit_type_id, visit_date, visit_time, notes, patient_id, doctor_id) values ('None', 'Complete', 1, '2010-11-14', '11:11', 'Patient is healthy', 1, 1);
insert into visit(diagnosis, status, visit_type_id, visit_date, visit_time, notes, patient_id, doctor_id) values ('Broken Left Foot', 'Complete', 4, '2010-12-31', '13:01', 'Patient broke left foot when she fell off a tree', 1, 2);
insert into visit(diagnosis, status, visit_type_id, visit_date, visit_time, notes, patient_id, doctor_id) values ('Kidney Stones', 'Complete', 4, '2010-12-31', '14:03', 'Patient is suffering moderate pain from kidney stones', 2, 2);
insert into visit(diagnosis, status, visit_type_id, visit_date, visit_time, notes, patient_id, doctor_id) values ('Heart Arrythimia', 'Complete', 3, '2010-12-31', '12:00', 'Patient reported his heartbeat felt irregular', 3, 3);

insert into medication(name) values ('Dummy Medicine 1');
insert into medication(name) values ('Dummy Medicine 2');
insert into medication(name) values ('Dummy Medicine 3');

insert into laboratory_test(name, description, address_id) values ('X-ray Imaging', "This test produces images of patient's bones", 5);
insert into laboratory_test(name, description, address_id) values ('CT Scan', "This test produces images of patient's interals", 5);
insert into laboratory_test(name, description, address_id) values ('Basic Metabolic Panel', "This tests the levels of calcium, glucose, sodium, potassium, bicarbonate, chloride, blood urea nitrogen (BUN), and creatinine levels in the blood", 6);

insert into prescribes(visit_id, medication_id, daily_dose, number_of_days) values (2, 1, 'two pill in the morning and two pills at night', 30);
insert into prescribes(visit_id, medication_id, daily_dose, number_of_days) values (2, 2, 'one pill a day', 10);
insert into prescribes(visit_id, medication_id, daily_dose, number_of_days) values (2, 3, 'one pill a day', 10);
insert into prescribes(visit_id, medication_id, daily_dose, number_of_days) values (4, 1, 'two pill in the morning and two pills at night', 30);
insert into prescribes(visit_id, medication_id, daily_dose, number_of_days) values (4, 2, 'two pill in the morning and two pills at night', 30);
insert into prescribes(visit_id, medication_id, daily_dose, number_of_days) values (4, 3, 'two pill in the morning and two pills at night', 30);

insert into performs_lab_test(visit_id, laboratory_test_id, perform_by_date, test_results, performed_on) values (2, 1, '2010-12-31', 'fractured foot', '2010-12-31');
insert into performs_lab_test(visit_id, laboratory_test_id, perform_by_date, test_results, performed_on) values (2, 3, '2011-01-07', null, null);

insert into time_slot(time_slot_date, start_time, end_time) values ('2010-11-14', '00:00', '12:00');
insert into time_slot(time_slot_date, start_time, end_time) values ('2010-12-31', '12:00', '23:59');

insert into works_on(doctor_id, time_slot_id) values (1, 1);
insert into works_on(doctor_id, time_slot_id) values (2, 2);
insert into works_on(doctor_id, time_slot_id) values (3, 2);

insert into appointment(appointment_date, appointment_time, patient_id, doctor_id, visit_type, status, notes) values ('2010-11-14', '11:00', 1, 1, 1, 'Completed', null);
insert into appointment(appointment_date, appointment_time, patient_id, doctor_id, visit_type, status, notes) values ('2010-12-31', '12:00', 1, 2, 4, 'Completed', null);
insert into appointment(appointment_date, appointment_time, patient_id, doctor_id, visit_type, status, notes) values ('2010-12-31', '12:00', 3, 3, 3, 'Completed', null);

insert into ward(name, number_of_beds, department_id) values ('Emergency Ward', 30, 5);
insert into ward(name, number_of_beds, department_id) values ('ICU Ward', 30, 4);
insert into ward(name, number_of_beds, department_id) values('Cardiology Ward', 30, 3);
insert into ward(name, number_of_beds, department_id) values ('Pediatrics Ward', 30, 2);
insert into ward(name, number_of_beds, department_id) values ('Oncology Ward', 30, 1);

insert into admits(visit_id, ward_number, admit_date, admit_time, discharge_date, discharge_time) values (2, 1, '2010-12-31', '12:00', '2010-12-31', '18:00');
insert into admits(visit_id, ward_number, admit_date, admit_time, discharge_date, discharge_time) values (3, 1, '2010-12-31', '14:03', null , null);





