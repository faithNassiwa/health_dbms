-- This file the commands for the creation of the hospital database management system

create database if not exists hospital;
use hospital; 

create table address
(id int auto_increment,
street varchar(50) not null,
city varchar(50) not null,
state varchar(50) not null,
postal_code varchar(50) not null,
country varchar(50) not null,
primary key(id));

create table department
(id int auto_increment,
name varchar(50) not null,
primary key(id));

create table doctor
(id int auto_increment,
first_name varchar(50) not null,
middle_name varchar(50),
last_name varchar(50) not null,
phone_number numeric(10, 0) not null,
date_of_birth date not null,
gender varchar(20) not null,
license_no varchar(20) not null,
address_id int not null,
department_id int not null,
primary key(id),
foreign key(address_id) references address(id),
foreign key(department_id) references department(id));

create table patient
(id int auto_increment,
first_name varchar(50) not null,
middle_name varchar(50),
last_name varchar(50) not null,
phone_number numeric(10,0) not null,
date_of_birth date not null,
gender varchar(20) not null,
address_id int not null,
primary key(id),
foreign key(address_id) references address(id));

create table expertise
(id int auto_increment,
area_of_expertise  varchar(50) not null,
primary key(id));

create table expert_in
(doctor_id int,
expertise_id int,
primary key(doctor_id, expertise_id),
foreign key(doctor_id) references doctor(id),
foreign key(expertise_id) references expertise(id));

create table visit_type
(id int auto_increment,
name varchar(50) not null,
primary key(id));

create table visit
(id int auto_increment,
diagnosis varchar(255) not null,
status varchar(50) not null,
visit_type_id int not null,
visit_date date not null,
visit_time time not null,
notes text,
patient_id int not null,
doctor_id int not null,
primary key(id),
foreign key(visit_type_id) references visit_type(id),
foreign key(patient_id) references patient(id),
foreign key(doctor_id) references doctor(id));

create table medication
(id int auto_increment,
name varchar(255) not null,
primary key(id));

create table laboratory_test
(id int auto_increment,
name varchar(50) not null,
description text not null,
address_id int not null,
primary key(id),
foreign key(address_id) references address(id));

create table prescribes
(visit_id int,
medication_id int,
daily_dose varchar(50) not null,
number_of_days numeric(4,0),
primary key(visit_id, medication_id),
foreign key(visit_id) references visit(id),
foreign key(medication_id) references medication(id),
check(number_of_days > 0));

create table performs_lab_test
(visit_id int,
laboratory_test_id int,
perform_by_date date not null,
test_results varchar(50),
performed_on date,
primary key(visit_id, laboratory_test_id),
foreign key(visit_id) references visit(id),
foreign key(laboratory_test_id) references laboratory_test(id));

create table time_slot
(id int auto_increment,
time_slot_date date not null,
start_time time not null,
end_time time not null,
primary key(id));

create table works_on
(doctor_id int,
time_slot_id int,
primary key(doctor_id, time_slot_id),
foreign key(doctor_id) references doctor(id),
foreign key(time_slot_id) references time_slot(id));

create table appointment
(id int auto_increment,
appointment_date date not null,
appointment_time time not null,
patient_id int not null,
doctor_id int not null,
visit_type int not null,
status varchar(50) not null,
notes text,
primary key(id),
foreign key(doctor_id) references doctor(id),
foreign key(patient_id) references patient(id),
foreign key(visit_type) references visit_type(id));

create table ward
(ward_number int auto_increment,
name varchar(50) not null,
number_of_beds numeric(5,0),
department_id int not null,
primary key(ward_number),
foreign key(department_id) references department(id));

create table admits
(visit_id int,
ward_number int,
admit_date date not null,
admit_time time not null,
discharge_date date,
discharge_time time,
primary key(visit_id, ward_number),
foreign key(visit_id) references visit(id),
foreign key(ward_number) references ward(ward_number));



