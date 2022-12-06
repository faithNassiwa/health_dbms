insert into address(street, city, state, postal_code, country) values ('100 Massachusetts Avenue', 'Boston', 'Massachusetts', '02115', 'USA');
insert into address(street, city, state, postal_code, country) values ('200 Technology Square', 'Cambridge', 'Massachusetts', '02139', 'USA');
insert into address(street, city, state, postal_code, country) values ('300 Massachusetts Avenue', 'Boston', 'Massachusetts', '02115', 'USA');
insert into address(street, city, state, postal_code, country) values ('4 Dursley Lane', 'Spring Hill', 'Tennesee', '37174', 'USA');
insert into address(street, city, state, postal_code, country) values ('55 Canal Street', 'Salem', 'Massachusetts', '02115', 'USA');
insert into address(street, city, state, postal_code, country) values ('600 Massachusetts Avenue', 'Boston', 'Massachusetts', '01970', 'USA');
insert into address(street, city, state, postal_code, country) values ('79 Main Street', 'Salem', 'New Hampshire', '03079', 'USA');
insert into address(street, city, state, postal_code, country) values ('81 Church Street', 'Manville', 'Rhode Island', '02838', 'USA');
insert into address(street, city, state, postal_code, country) values ('990 Hancock Street', 'Quincy', 'Massachusetts', '02171', 'USA');
insert into address(street, city, state, postal_code, country) values ('10 Park Street', 'Portsmouth', 'New Hampshire', '03801', 'USA');
insert into address(street, city, state, postal_code, country) values ('11 Park Street', 'Portsmouth', 'New Hampshire', '03801', 'USA');
insert into address(street, city, state, postal_code, country) values ('12 Baker Circle', 'Chestnut Hill', 'Massachusetts', '02467', 'USA');
insert into address(street, city, state, postal_code, country) values ('13  Ocean Road', 'Portsmouth', 'New Hampshire', '03801', 'USA');
insert into address(street, city, state, postal_code, country) values ('14 Baker Avenue', 'Quincy', 'Massachusetts', '02171', 'USA');
insert into address(street, city, state, postal_code, country) values ('742 Evergreen Terrace', 'Springfield', 'Massachusetts', '01109', 'USA');
insert into address(street, city, state, postal_code, country) values ('16 Marlborough Street', 'Boston', 'Massachusetts', '02116', 'USA');
insert into address(street, city, state, postal_code, country) values ('170 Technology Square', 'Cambridge', 'Massachusetts', '02139', 'USA');
insert into address(street, city, state, postal_code, country) values ('180 Huntington Street', 'Boston', 'Massachusetts', '02115', 'USA');
insert into address(street, city, state, postal_code, country) values ('190 Huntington Street', 'Boston', 'Massachusetts', '02115', 'USA');
insert into address(street, city, state, postal_code, country) values ('20 Spooner Street', 'Quahog', 'Rhode Island', '02907', 'USA');


insert into department(name) values ('Oncology');
insert into department(name) values ('Pediatrics');
insert into department(name) values ('Cardiology');
insert into department(name) values ('Intensive Care Unit');
insert into department(name) values ('Emergency/Casualty');
insert into department(name) values ('Psychiatry');
insert into department(name) values ('General Surgery');
insert into department(name) values ('Urology');
insert into department(name) values ('Neurology');
insert into department(name) values ('Opthalmology');
insert into department(name) values ('Haematology');
insert into department(name) values ('Gynaecology');
insert into department(name) values ('Gastroenterology');
insert into department(name) values ('ENT');


insert into doctor(first_name, middle_name, last_name, phone_number, date_of_birth, gender, license_no, address_id, department_id) values ('Michael', 'Gary', 'Scott', 6178675309, '1965-03-15', 'Male', '0000000001', 1, 1);
insert into doctor(first_name, middle_name, last_name, phone_number, date_of_birth, gender, license_no, address_id, department_id) values ('Hugh', null, 'Laurie', 5088675309, '1959-06-11', 'Male', '0000000002', 2, 2);
insert into doctor(first_name, middle_name, last_name, phone_number, date_of_birth, gender, license_no, address_id, department_id) values ('Ann', null, 'Chovie', 4138675309, '1999-09-22', 'Female', '0000000003', 2, 3);
insert into doctor(first_name, middle_name, last_name, phone_number, date_of_birth, gender, license_no, address_id, department_id) values ('Anita', null, 'Mui', 4138675308, '1963-10-10', 'Female', '0000000004', 3, 4);
insert into doctor(first_name, middle_name, last_name, phone_number, date_of_birth, gender, license_no, address_id, department_id) values ('Christopher', 'Peter', 'Bacon', 4138675307, '1989-05-09', 'Male', '0000000005', 4, 5);
insert into doctor(first_name, middle_name, last_name, phone_number, date_of_birth, gender, license_no, address_id, department_id) values ('Crystal', null, 'Ball', 4138675306, '1972-01-12', 'Female', '0000000006', 5, 6);
insert into doctor(first_name, middle_name, last_name, phone_number, date_of_birth, gender, license_no, address_id, department_id) values ('Alfred', 'Edward', 'Gater', 4138675305, '1991-02-07', 'Male', '0000000007', 6, 7);
insert into doctor(first_name, middle_name, last_name, phone_number, date_of_birth, gender, license_no, address_id, department_id) values ('John', 'Jacob', 'Jingleheimer-Schmidt', 4138675304, '1969-04-16', 'Male', '0000000008', 7, 8);
insert into doctor(first_name, middle_name, last_name, phone_number, date_of_birth, gender, license_no, address_id, department_id) values ('Eileen', null, 'Dover', 4138675303, '1985-05-16', 'Female', '0000000009', 8, 9);
insert into doctor(first_name, middle_name, last_name, phone_number, date_of_birth, gender, license_no, address_id, department_id) values ('Xin', null, 'Zhao', 4138675302, '1977-07-16', 'Male', '0000000010', 9, 10);


insert into patient(first_name, middle_name, last_name, phone_number, date_of_birth, gender, address_id) values ('Pippi', null, 'Longstocking', 7818675309, '1945-05-30', 'Female', 3);
insert into patient(first_name, middle_name, last_name, phone_number, date_of_birth, gender, address_id) values ('Carl', 'Edward', 'Sagan', 3398675309, '1934-11-09', 'Male', 10);
insert into patient(first_name, middle_name, last_name, phone_number, date_of_birth, gender, address_id) values ('Tom', null, 'Ato', 3518675309, '1980-04-21', 'Male', 11);
insert into patient(first_name, middle_name, last_name, phone_number, date_of_birth, gender, address_id) values ('Sanjay', null, 'Gupta', 3518675308, '1969-10-23', 'Male', 12);
insert into patient(first_name, middle_name, last_name, phone_number, date_of_birth, gender, address_id) values ('Priya', null, 'Patel', 3518675307, '1971-09-14', 'Female', 12);
insert into patient(first_name, middle_name, last_name, phone_number, date_of_birth, gender, address_id) values ('Fernando', null, 'Torres', 3518675306, '1984-03-20', 'Male', 13);
insert into patient(first_name, middle_name, last_name, phone_number, date_of_birth, gender, address_id) values ('Jane', 'Mary', 'Doe', 3518675305, '2004-08-01', 'Female', 14);
insert into patient(first_name, middle_name, last_name, phone_number, date_of_birth, gender, address_id) values ('Lisa', 'Marie', 'Simpson', 3518675304, '2004-05-09', 'Female', 15);
insert into patient(first_name, middle_name, last_name, phone_number, date_of_birth, gender, address_id) values ('Maria', null, 'Torres', 3518675303, '1991-09-06', 'Female', 16);
insert into patient(first_name, middle_name, last_name, phone_number, date_of_birth, gender, address_id) values ('John', 'Peter', 'Do', 3518675302, '2015-09-06', 'Male', 17);


insert into expertise(area_of_expertise) values ('Breast Cancer');
insert into expertise(area_of_expertise) values ('Child Development');
insert into expertise(area_of_expertise) values ('Coronary Artery Bypass Grafting');
insert into expertise(area_of_expertise) values ('Trauma');
insert into expertise(area_of_expertise) values ('Internal Medicine');
insert into expertise(area_of_expertise) values ('Critical Care Medicine');
insert into expertise(area_of_expertise) values ('Emergency Medicine');
insert into expertise(area_of_expertise) values ('Allergies');
insert into expertise(area_of_expertise) values ('Colon Cancer');
insert into expertise(area_of_expertise) values ('Leukemia');
insert into expertise(area_of_expertise) values ('Infectious Disease');
insert into expertise(area_of_expertise) values ("Parkinson's Disease");
insert into expertise(area_of_expertise) values ('Pregnancy');
insert into expertise(area_of_expertise) values ('Glaucoma');
insert into expertise(area_of_expertise) values ('Infertility');
insert into expertise(area_of_expertise) values ('Depression');
insert into expertise(area_of_expertise) values ('Appendix Removal');


insert into expert_in(doctor_id, expertise_id) values (1,1);
insert into expert_in(doctor_id, expertise_id) values (1,5);
insert into expert_in(doctor_id, expertise_id) values (2,1);
insert into expert_in(doctor_id, expertise_id) values (2,2);
insert into expert_in(doctor_id, expertise_id) values (2,3);
insert into expert_in(doctor_id, expertise_id) values (2,4);
insert into expert_in(doctor_id, expertise_id) values (2,5);
insert into expert_in(doctor_id, expertise_id) values (3,3);
insert into expert_in(doctor_id, expertise_id) values (4,6);
insert into expert_in(doctor_id, expertise_id) values (5,4);
insert into expert_in(doctor_id, expertise_id) values (5,6);
insert into expert_in(doctor_id, expertise_id) values (5,7);
insert into expert_in(doctor_id, expertise_id) values (5,8);
insert into expert_in(doctor_id, expertise_id) values (6,16);
insert into expert_in(doctor_id, expertise_id) values (7,17);
insert into expert_in(doctor_id, expertise_id) values (8,15);
insert into expert_in(doctor_id, expertise_id) values (9,12);
insert into expert_in(doctor_id, expertise_id) values (10,14);


insert into visit_type(name) values ('Physical Examination');
insert into visit_type(name) values ('Oncology Visit');
insert into visit_type(name) values ('Cardiology Visit');
insert into visit_type(name) values ('Emergency Room Visit');
insert into visit_type(name) values ('Psychiatry Visit');
insert into visit_type(name) values ('Colonoscopy Procedure');
insert into visit_type(name) values ('Mammogram Procedure');
insert into visit_type(name) values ('Surgery Procedure');
insert into visit_type(name) values ('Fertility Procedure');
insert into visit_type(name) values ('Urgent Care Visit');
insert into visit_type(name) values ('Eye Examination');

insert into visit(diagnosis, status, visit_type_id, visit_date, visit_time, notes, patient_id, doctor_id) values ('None', 'Complete', 1, '2010-11-14', '11:11', 'Patient is healthy', 1, 1);
insert into visit(diagnosis, status, visit_type_id, visit_date, visit_time, notes, patient_id, doctor_id) values ('Broken Left Foot', 'Complete', 4, '2010-12-31', '13:01', 'Patient broke left foot when she fell off a tree', 1, 2);
insert into visit(diagnosis, status, visit_type_id, visit_date, visit_time, notes, patient_id, doctor_id) values ('Kidney Stones', 'Complete', 4, '2010-12-31', '14:03', 'Patient is suffering moderate pain from kidney stones', 2, 2);
insert into visit(diagnosis, status, visit_type_id, visit_date, visit_time, notes, patient_id, doctor_id) values ('Heart Arrythimia', 'Complete', 3, '2010-12-31', '12:00', 'Patient reported his heartbeat felt irregular', 3, 3);
insert into visit(diagnosis, status, visit_type_id, visit_date, visit_time, notes, patient_id, doctor_id) values ('Sore throat, fever, fatigue', 'Complete', 1, '2022-01-01', '07:05', 'Patient is felt unwell for a few days. Experiencing sore throat, fever, fatigue. Will be admitted as a precaution', 1, 1);
insert into visit(diagnosis, status, visit_type_id, visit_date, visit_time, notes, patient_id, doctor_id) values ('Chest Pain', 'Complete', 3, '2022-01-01', '09:05', 'Patient has been experiencing chest pains for a few days. Will be admitted as a precaution', 2, 3);
insert into visit(diagnosis, status, visit_type_id, visit_date, visit_time, notes, patient_id, doctor_id) values ('Fatigue, shortness of breath, high fever', 'Complete', 10, '2022-01-01', '14:05', 'Patient has been experiencing severe COVID-19-like symptoms for a few days. Will be admitted as a precaution', 4, 4);
insert into visit(diagnosis, status, visit_type_id, visit_date, visit_time, notes, patient_id, doctor_id) values ('Mammogram completed. COVID-symptoms', 'Complete', 7, '2022-01-02', '10:05', 'Patient has been experiencing severe COVID-19-like symptoms for a few days. Will be admitted as a precaution', 5, 1);
insert into visit(diagnosis, status, visit_type_id, visit_date, visit_time, notes, patient_id, doctor_id) values ('COVID-symptoms', 'Complete', 1, '2022-01-04', '08:05', 'Patient has been experiencing severe COVID-19-like symptoms for a few days. Will be admitted as a precaution', 6, 9);
insert into visit(diagnosis, status, visit_type_id, visit_date, visit_time, notes, patient_id, doctor_id) values ('COVID-symptoms', 'Complete', 1, '2022-01-04', '12:05', 'Patient has been experiencing severe COVID-19-like symptoms for a few days. Will be admitted as a precaution', 7, 9);
insert into visit(diagnosis, status, visit_type_id, visit_date, visit_time, notes, patient_id, doctor_id) values ('Hallucinations', 'Complete', 5, '2022-01-05', '07:11', 'Patient has been experiencing auditory and visual hallucinations. Will be admitted', 8, 6);
insert into visit(diagnosis, status, visit_type_id, visit_date, visit_time, notes, patient_id, doctor_id) values ('Appendix Removed', 'Complete', 8, '2022-01-05', '16:11', "Patient's appendix was successfully removed without complications", 9, 7);
insert into visit(diagnosis, status, visit_type_id, visit_date, visit_time, notes, patient_id, doctor_id) values ('COVID-symptoms', 'Complete', 1, '2022-01-04', '07:05', 'Patient has been experiencing severe COVID-19-like symptoms for a few days. Will be admitted as a precaution', 10, 8);

insert into medication(name) values ('Dummy Medicine 1');
insert into medication(name) values ('Dummy Medicine 2');
insert into medication(name) values ('Dummy Medicine 3');
insert into medication(name) values ('Dummy Medicine 4');
insert into medication(name) values ('Dummy Medicine 5');
insert into medication(name) values ('Dummy Medicine 6');
insert into medication(name) values ('Dummy Medicine 7');
insert into medication(name) values ('Dummy Medicine 8');
insert into medication(name) values ('Dummy Medicine 9');
insert into medication(name) values ('Dummy Medicine 10');


insert into laboratory_test(name, description, address_id) values ('X-ray Imaging', "This test produces images of patient's bones", 5);
insert into laboratory_test(name, description, address_id) values ('CT Scan', "This test produces images of patient's interals", 5);
insert into laboratory_test(name, description, address_id) values ('Basic Metabolic Panel', "This tests the levels of calcium, glucose, sodium, potassium, bicarbonate, chloride, blood urea nitrogen (BUN), and creatinine levels in the blood", 5);
insert into laboratory_test(name, description, address_id) values ('Tumor Marker', "This tests for substances that are released by cancer cells or by the body in response to cancer cells", 5);
insert into laboratory_test(name, description, address_id) values ('Urinalysis', "This is the examination of urine for various cells and chemicals", 5);
insert into laboratory_test(name, description, address_id) values ('Liver Function Test', "A series of special blood tests can often determine whether or not the liver is functioning properly", 5);
insert into laboratory_test(name, description, address_id) values ('Complete Blood Count (CBC)', "This tests measures the count of red blood cells, white blood cells, hemoglobin, hematocrit, and platelets in a blood sample", 5);
insert into laboratory_test(name, description, address_id) values ('Pap Smear', "This test screens for cervical cancer", 5);
insert into laboratory_test(name, description, address_id) values ('Comprehensive Metabolic Panel', "This test measures the levels of 14 difffernet substances in a blood sample", 5);
insert into laboratory_test(name, description, address_id) values ('Lipid Panel', "This test measures the cholesterol and triglyceride levels in a blood sample", 5);
insert into laboratory_test(name, description, address_id) values ('Magnetic Resonance Imaging (MRI)', "This uses magnetic fields to image a patient", 5);
insert into laboratory_test(name, description, address_id) values ('Ultrasound Imaging', "This uses ultra to image a patient's internals", 5);
insert into laboratory_test(name, description, address_id) values ('COVID-19 PCR Test', "This tests for the presence of the virus that causes COVID-19", 5);
insert into laboratory_test(name, description, address_id) values ('Influenza PCR Test', "This tests for the presence of the virus that causes influenza", 5);

insert into prescribes(visit_id, medication_id, daily_dose, number_of_days) values (2, 1, 'two pill in the morning and two pills at night', 30);
insert into prescribes(visit_id, medication_id, daily_dose, number_of_days) values (2, 2, 'one pill a day', 10);
insert into prescribes(visit_id, medication_id, daily_dose, number_of_days) values (2, 3, 'one pill a day', 10);
insert into prescribes(visit_id, medication_id, daily_dose, number_of_days) values (4, 1, 'two pill in the morning and two pills at night', 30);
insert into prescribes(visit_id, medication_id, daily_dose, number_of_days) values (4, 2, 'two pill in the morning and two pills at night', 30);
insert into prescribes(visit_id, medication_id, daily_dose, number_of_days) values (4, 3, 'two pill in the morning and two pills at night', 30);
insert into prescribes(visit_id, medication_id, daily_dose, number_of_days) values (5, 1, 'two pill in the morning and two pills at night', 30);
insert into prescribes(visit_id, medication_id, daily_dose, number_of_days) values (6, 4, 'two pill in the morning and two pills at night', 30);
insert into prescribes(visit_id, medication_id, daily_dose, number_of_days) values (6, 5, 'one pill a day', 10);
insert into prescribes(visit_id, medication_id, daily_dose, number_of_days) values (7, 5, 'one pill a day', 10);
insert into prescribes(visit_id, medication_id, daily_dose, number_of_days) values (8, 5, 'one pill a day', 10);
insert into prescribes(visit_id, medication_id, daily_dose, number_of_days) values (9, 6, 'one pill a day', 10);
insert into prescribes(visit_id, medication_id, daily_dose, number_of_days) values (10, 5, 'one pill a day', 90);
insert into prescribes(visit_id, medication_id, daily_dose, number_of_days) values (11, 8, 'one pill a day', 90);
insert into prescribes(visit_id, medication_id, daily_dose, number_of_days) values (12, 2, 'one pill a day', 90);
insert into prescribes(visit_id, medication_id, daily_dose, number_of_days) values (13, 3, 'one pill a day', 10);

insert into performs_lab_test(visit_id, laboratory_test_id, perform_by_date, test_results, performed_on) values (2, 1, '2010-12-31', 'fractured foot', '2010-12-31');
insert into performs_lab_test(visit_id, laboratory_test_id, perform_by_date, test_results, performed_on) values (2, 3, '2011-01-07', null, null);
insert into performs_lab_test(visit_id, laboratory_test_id, perform_by_date, test_results, performed_on) values (5, 13, '2022-01-01', 'Negative Result', '2022-01-01');
insert into performs_lab_test(visit_id, laboratory_test_id, perform_by_date, test_results, performed_on) values (5, 14, '2022-01-01', 'Positive Result', '2022-01-01');
insert into performs_lab_test(visit_id, laboratory_test_id, perform_by_date, test_results, performed_on) values (6, 7, '2022-01-01', 'Blood count low', '2022-01-01');
insert into performs_lab_test(visit_id, laboratory_test_id, perform_by_date, test_results, performed_on) values (6, 9, '2022-01-01', 'Results within expectation', '2022-01-01');
insert into performs_lab_test(visit_id, laboratory_test_id, perform_by_date, test_results, performed_on) values (7, 13, '2022-01-01', 'Positive Result', '2022-01-01');
insert into performs_lab_test(visit_id, laboratory_test_id, perform_by_date, test_results, performed_on) values (7, 14, '2022-01-01', 'Negative Result', '2022-01-01');
insert into performs_lab_test(visit_id, laboratory_test_id, perform_by_date, test_results, performed_on) values (8, 1, '2022-01-02', 'No abnormalities detected in breasts', '2022-01-02');
insert into performs_lab_test(visit_id, laboratory_test_id, perform_by_date, test_results, performed_on) values (8, 13, '2022-01-02', 'Positive Result', '2022-01-02');
insert into performs_lab_test(visit_id, laboratory_test_id, perform_by_date, test_results, performed_on) values (9, 13, '2022-01-04', 'Positive Result', '2022-01-04');
insert into performs_lab_test(visit_id, laboratory_test_id, perform_by_date, test_results, performed_on) values (10, 13, '2022-01-04', 'Positive Result', '2022-01-04');
insert into performs_lab_test(visit_id, laboratory_test_id, perform_by_date, test_results, performed_on) values (10, 3, '2022-01-05', 'Results within expectation', '2022-01-04');
insert into performs_lab_test(visit_id, laboratory_test_id, perform_by_date, test_results, performed_on) values (11, 9, '2022-01-05', 'Results within expectation', '2022-01-05');
insert into performs_lab_test(visit_id, laboratory_test_id, perform_by_date, test_results, performed_on) values (13, 13, '2022-01-06', 'Positive Result', '2022-01-06');


insert into time_slot(time_slot_date, start_time, end_time) values ('2010-11-14', '00:00', '11:59');
insert into time_slot(time_slot_date, start_time, end_time) values ('2010-12-31', '12:00', '23:59');
insert into time_slot(time_slot_date, start_time, end_time) values ('2022-01-01', '00:00', '11:59');
insert into time_slot(time_slot_date, start_time, end_time) values ('2022-01-01', '12:00', '23:59');
insert into time_slot(time_slot_date, start_time, end_time) values ('2022-01-02', '00:00', '11:59');
insert into time_slot(time_slot_date, start_time, end_time) values ('2022-01-02', '12:00', '23:59');
insert into time_slot(time_slot_date, start_time, end_time) values ('2022-01-03', '00:00', '11:59');
insert into time_slot(time_slot_date, start_time, end_time) values ('2022-01-03', '12:00', '23:59');
insert into time_slot(time_slot_date, start_time, end_time) values ('2022-01-04', '00:00', '11:59');
insert into time_slot(time_slot_date, start_time, end_time) values ('2022-01-04', '12:00', '23:59');
insert into time_slot(time_slot_date, start_time, end_time) values ('2022-01-05', '00:00', '11:59');
insert into time_slot(time_slot_date, start_time, end_time) values ('2022-01-05', '12:00', '23:59');
insert into time_slot(time_slot_date, start_time, end_time) values ('2022-11-06', '00:00', '11:59');
insert into time_slot(time_slot_date, start_time, end_time) values ('2023-01-06', '12:00', '23:59');
insert into time_slot(time_slot_date, start_time, end_time) values ('2022-12-30', '00:00', '11:59');
insert into time_slot(time_slot_date, start_time, end_time) values ('2023-01-07', '12:00', '23:59');


insert into works_on(doctor_id, time_slot_id) values (1, 1);
insert into works_on(doctor_id, time_slot_id) values (2, 2);
insert into works_on(doctor_id, time_slot_id) values (3, 2);
insert into works_on(doctor_id, time_slot_id) values (1, 3);
insert into works_on(doctor_id, time_slot_id) values (1, 5);
insert into works_on(doctor_id, time_slot_id) values (1, 7);
insert into works_on(doctor_id, time_slot_id) values (2, 4);
insert into works_on(doctor_id, time_slot_id) values (2, 6);
insert into works_on(doctor_id, time_slot_id) values (2, 8);
insert into works_on(doctor_id, time_slot_id) values (3, 3);
insert into works_on(doctor_id, time_slot_id) values (3, 5);
insert into works_on(doctor_id, time_slot_id) values (3, 7);
insert into works_on(doctor_id, time_slot_id) values (4, 4);
insert into works_on(doctor_id, time_slot_id) values (4, 6);
insert into works_on(doctor_id, time_slot_id) values (4, 8);
insert into works_on(doctor_id, time_slot_id) values (5, 10);
insert into works_on(doctor_id, time_slot_id) values (5, 12);
insert into works_on(doctor_id, time_slot_id) values (5, 14);
insert into works_on(doctor_id, time_slot_id) values (6, 11);
insert into works_on(doctor_id, time_slot_id) values (6, 13);
insert into works_on(doctor_id, time_slot_id) values (6, 15);
insert into works_on(doctor_id, time_slot_id) values (7, 10);
insert into works_on(doctor_id, time_slot_id) values (7, 12);
insert into works_on(doctor_id, time_slot_id) values (7, 14);
insert into works_on(doctor_id, time_slot_id) values (8, 11);
insert into works_on(doctor_id, time_slot_id) values (8, 13);
insert into works_on(doctor_id, time_slot_id) values (8, 15);
insert into works_on(doctor_id, time_slot_id) values (9, 9);
insert into works_on(doctor_id, time_slot_id) values (9, 10);
insert into works_on(doctor_id, time_slot_id) values (10, 15);
insert into works_on(doctor_id, time_slot_id) values (10, 16);


insert into appointment(appointment_date, appointment_time, patient_id, doctor_id, visit_type, status, notes) values ('2010-11-14', '11:00', 1, 1, 1, 'Completed', null);
insert into appointment(appointment_date, appointment_time, patient_id, doctor_id, visit_type, status, notes) values ('2010-12-31', '12:00', 1, 2, 3, 'Completed', null);
insert into appointment(appointment_date, appointment_time, patient_id, doctor_id, visit_type, status, notes) values ('2010-12-31', '12:00', 3, 3, 3, 'Completed', null);
insert into appointment(appointment_date, appointment_time, patient_id, doctor_id, visit_type, status, notes) values ('2022-01-01', '7:00', 1, 1, 1, 'Completed', null);
insert into appointment(appointment_date, appointment_time, patient_id, doctor_id, visit_type, status, notes) values ('2022-01-01', '9:00', 2, 3, 3, 'Completed', null);
insert into appointment(appointment_date, appointment_time, patient_id, doctor_id, visit_type, status, notes) values ('2022-01-01', '14:00', 4, 4, 10, 'Completed', null);
insert into appointment(appointment_date, appointment_time, patient_id, doctor_id, visit_type, status, notes) values ('2022-01-02', '10:00', 5, 1, 7, 'Completed', null);
insert into appointment(appointment_date, appointment_time, patient_id, doctor_id, visit_type, status, notes) values ('2022-01-04', '8:00', 6, 9, 1, 'Completed', null);
insert into appointment(appointment_date, appointment_time, patient_id, doctor_id, visit_type, status, notes) values ('2022-01-04', '12:00', 7, 9, 1, 'Completed', null);
insert into appointment(appointment_date, appointment_time, patient_id, doctor_id, visit_type, status, notes) values ('2022-01-05', '07:00', 8, 6, 5, 'Completed', null);
insert into appointment(appointment_date, appointment_time, patient_id, doctor_id, visit_type, status, notes) values ('2022-01-05', '16:00', 9, 7, 8, 'Completed', 'Appendix Removal');
insert into appointment(appointment_date, appointment_time, patient_id, doctor_id, visit_type, status, notes) values ('2022-01-06', '07:00', 10, 8, 1, 'Completed', null);


insert into ward(name, number_of_beds, department_id) values ('Emergency Ward', 30, 5);
insert into ward(name, number_of_beds, department_id) values ('ICU Ward', 30, 4);
insert into ward(name, number_of_beds, department_id) values('Cardiology Ward', 30, 3);
insert into ward(name, number_of_beds, department_id) values ('Pediatrics Ward', 30, 2);
insert into ward(name, number_of_beds, department_id) values ('Oncology Ward', 30, 1);
insert into ward(name, number_of_beds, department_id) values ('Psychiatric Ward', 30, 6);
insert into ward(name, number_of_beds, department_id) values ('Surgery Ward', 30, 7);
insert into ward(name, number_of_beds, department_id) values ('Urology Ward', 30, 8);
insert into ward(name, number_of_beds, department_id) values ('Neurology Ward', 30, 9);
insert into ward(name, number_of_beds, department_id) values ('Opthamology Ward', 30, 10);

insert into admits(visit_id, ward_number, admit_date, admit_time, discharge_date, discharge_time) values (2, 1, '2010-12-31', '12:00', '2010-12-31', '18:00');
insert into admits(visit_id, ward_number, admit_date, admit_time, discharge_date, discharge_time) values (3, 1, '2010-12-31', '14:03', '2011-01-02' , '11:06');
insert into admits(visit_id, ward_number, admit_date, admit_time, discharge_date, discharge_time) values (5, 1, '2022-01-01', '08:03', null , null);
insert into admits(visit_id, ward_number, admit_date, admit_time, discharge_date, discharge_time) values (6, 3, '2022-01-01', '10:03', '2022-01-04' , '11:45');
insert into admits(visit_id, ward_number, admit_date, admit_time, discharge_date, discharge_time) values (7, 1, '2022-01-01', '14:33', null , null);
insert into admits(visit_id, ward_number, admit_date, admit_time, discharge_date, discharge_time) values (8, 5, '2022-01-02', '10:33',  '2022-01-02', '13:43');
insert into admits(visit_id, ward_number, admit_date, admit_time, discharge_date, discharge_time) values (9, 1, '2022-01-04', '08:33',  '2022-01-05', '06:43');
insert into admits(visit_id, ward_number, admit_date, admit_time, discharge_date, discharge_time) values (10, 1, '2022-01-04', '12:33',  '2022-01-05', '11:43');
insert into admits(visit_id, ward_number, admit_date, admit_time, discharge_date, discharge_time) values (11, 6, '2022-01-05', '08:33',  null, null);
insert into admits(visit_id, ward_number, admit_date, admit_time, discharge_date, discharge_time) values (12, 7, '2022-01-05', '23:33',  null, null);
insert into admits(visit_id, ward_number, admit_date, admit_time, discharge_date, discharge_time) values (13, 7, '2022-01-06', '07:53',  null, null);

