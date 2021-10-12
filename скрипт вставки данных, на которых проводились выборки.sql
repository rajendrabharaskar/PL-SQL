INSERT INTO region(region_name) VALUES ('����������� �������');
INSERT INTO region(region_name) VALUES ('���������� �������');
INSERT INTO region(region_name) VALUES ('������������ �������');
INSERT INTO region(region_name) VALUES ('������������ �������');
INSERT INTO region(region_name) VALUES ('������� �������');
INSERT INTO region(region_name) VALUES ('������������� ����');
INSERT INTO region(region_name) VALUES ('������������� �������');
INSERT INTO region(region_name) VALUES ('�������� ����');
INSERT INTO region(region_name) VALUES ('���������� ����');
INSERT INTO region(region_name) VALUES ('�������� �������');


INSERT INTO cities(city_name, region_id) VALUES ('����', 1);
INSERT INTO cities(city_name, region_id) VALUES ('������', 2);
INSERT INTO cities(city_name, region_id) VALUES ('�����������', 3);
INSERT INTO cities(city_name, region_id) VALUES ('����������', 4);
INSERT INTO cities(city_name, region_id) VALUES ('�����', 5);
INSERT INTO cities(city_name, region_id) VALUES ('���������', 6);
INSERT INTO cities(city_name, region_id) VALUES ('�����-���������', 7);
INSERT INTO cities(city_name, region_id) VALUES ('�����', 8);
INSERT INTO cities(city_name, region_id) VALUES ('�����������', 9);
INSERT INTO cities(city_name, region_id) VALUES ('�����', 10);


INSERT INTO med_organization(organization_name, city_id) VALUES ('�������', 2);
INSERT INTO med_organization(organization_name, city_id) VALUES ('�����', 3);
INSERT INTO med_organization(organization_name, city_id) VALUES ('��������', 4);
INSERT INTO med_organization(organization_name, city_id) VALUES ('������', 5);
INSERT INTO med_organization(organization_name, city_id) VALUES ('������', 6);
INSERT INTO med_organization(organization_name, city_id) VALUES ('�������', 7);
INSERT INTO med_organization(organization_name, city_id) VALUES ('Health', 8);
INSERT INTO med_organization(organization_name, city_id) VALUES ('�������', 9);
INSERT INTO med_organization(organization_name, city_id) VALUES ('�����', 10);
INSERT INTO med_organization(organization_name, city_id) VALUES ('����1', 10);


INSERT INTO types_hospital(type_name) VALUES ('�������');
INSERT INTO types_hospital(type_name) VALUES ('���������������');


insert into PROFILE_WORKING_HOURS(monday_start_time, monday_end_time, tuesday_start_time, tuesday_end_time, wednesday_start_time, wednesday_end_time, thursday_start_time, thursday_end_time, friday_start_time, friday_end_time, saturday_start_time, saturday_end_time, sunday_start_time, sunday_end_time) values (28800, 64800, 28800, 64800, 28800, 64800, 28800, 64800, 28800, 64800, 28800, 64800, 28800, 64800);


INSERT INTO hospitals(hospital_name, organization_id, type_id, WORKING_HOURS_ID, AVAILABILITY) VALUES ('�������� �1', 2, 2, 1,'true');
INSERT INTO hospitals(hospital_name, organization_id, type_id, WORKING_HOURS_ID, delete_dt, AVAILABILITY) VALUES ('�������� �2', 3, 1, 1, '28.09.2021', 'true');
INSERT INTO hospitals(hospital_name, organization_id, type_id, WORKING_HOURS_ID, AVAILABILITY) VALUES ('�������� �3', 4, 2, 1, 'true');
INSERT INTO hospitals(hospital_name, organization_id, type_id, WORKING_HOURS_ID, AVAILABILITY) VALUES ('�������� �4', 5, 1, 1, 'true');
INSERT INTO hospitals(hospital_name, organization_id, type_id, WORKING_HOURS_ID, AVAILABILITY) VALUES ('�������� �5', 6, 2, 1, 'true');


insert into gender(gender) values ('�������');
insert into gender(gender) values ('�������');
insert into gender(gender) values ('�����');


INSERT INTO specialties(speciality_name, REQUIRED_GENDER_ID, REQUIRED_MIN_AGE, REQUIRED_MAX_AGE) VALUES ('������', 3, 18, 120);
INSERT INTO specialties(speciality_name, REQUIRED_GENDER_ID, REQUIRED_MIN_AGE, REQUIRED_MAX_AGE, DELETE_DT) VALUES ('��������', 3, 18, 120, '20.07.2021');
INSERT INTO specialties(speciality_name, REQUIRED_GENDER_ID, REQUIRED_MIN_AGE, REQUIRED_MAX_AGE) VALUES ('���', 3, 0, 120);
INSERT INTO specialties(speciality_name, REQUIRED_GENDER_ID, REQUIRED_MIN_AGE, REQUIRED_MAX_AGE) VALUES ('�������', 3, 0, 18);
INSERT INTO specialties(speciality_name, REQUIRED_GENDER_ID, REQUIRED_MIN_AGE, REQUIRED_MAX_AGE) VALUES ('���������', 2, 0, 120);


INSERT INTO qualifications(qualification_name, QUALIFICATION_LEVEL) VALUES ('�������', 5);
INSERT INTO qualifications(qualification_name, QUALIFICATION_LEVEL) VALUES ('�������', 1);
INSERT INTO qualifications(qualification_name, QUALIFICATION_LEVEL) VALUES ('�������', 2);
INSERT INTO qualifications(qualification_name, QUALIFICATION_LEVEL) VALUES ('�������', 3);
INSERT INTO qualifications(qualification_name, QUALIFICATION_LEVEL) VALUES ('���������', 4);


INSERT INTO AREAS(area_name) VALUES ('������');
INSERT INTO AREAS(area_name) VALUES ('������');
INSERT INTO AREAS(area_name) VALUES ('������');
INSERT INTO AREAS(area_name) VALUES ('���������');
INSERT INTO AREAS(area_name) VALUES ('�����');


INSERT INTO DOCTORS(hospital_id, area_id, qualification_id, doctor_name) VALUES (1, 1, 3, '�������� ����');
INSERT INTO DOCTORS(hospital_id, area_id, qualification_id, doctor_name, DELETE_DT) VALUES (2, 2, 4, '������ ����', '15.06.2020');
INSERT INTO DOCTORS(hospital_id, area_id, qualification_id, doctor_name) VALUES (3, 3, 5, '������� ����');
INSERT INTO DOCTORS(hospital_id, area_id, qualification_id, doctor_name) VALUES (4, 4, 5, '������� ����');
INSERT INTO DOCTORS(hospital_id, area_id, qualification_id, doctor_name) VALUES (5, 5, 1, '������ �������');


INSERT INTO TALONS(START_date, end_date, doctor_id) VALUES ('28.09.2021', '17.10.2021', 1);
INSERT INTO TALONS(DELETE_DT, START_date, end_date, doctor_id) VALUES ('25.09.2021', '26.09.2021', '17.10.2021', 5);
INSERT INTO TALONS(START_date, end_date, doctor_id) VALUES ('23.09.2021', '27.10.2021', 2);
INSERT INTO TALONS(START_date, end_date, doctor_id) VALUES ('30.09.2021', '17.10.2021', 3);
INSERT INTO TALONS(START_date, end_date, doctor_id) VALUES ('7.10.2021', '17.10.2021', 5);


INSERT INTO USERS(login) VALUES ('user1');
INSERT INTO USERS(login) VALUES ('user2');
INSERT INTO USERS(login) VALUES ('student');
INSERT INTO USERS(login) VALUES ('lifer');
INSERT INTO USERS(login) VALUES ('rbq');


INSERT INTO patients(surname, name, middle_name, date_birth, serial_doc, gender_id, phone_number, area_id, user_id) values ('��������', '�������', '���������', '17.05.1995', 123433, 1, 79991234567, 1, 1);
INSERT INTO patients(surname, name, middle_name, date_birth, serial_doc, GENDER_ID, phone_number, area_id, user_id) values ('������', '�������', '���������', '07.03.1993', 123663, 1, 79991234567, 2, 2);
INSERT INTO patients(surname, name, middle_name, date_birth, serial_doc, GENDER_ID, phone_number, area_id, user_id) values ('������', '�������', '���������', '13.04.1992', 127723, 1, 79991234567, 3, 3);
INSERT INTO patients(surname, name, middle_name, date_birth, serial_doc, GENDER_ID, phone_number, area_id, user_id) values ('�������', '�������', '������������', '24.05.1991', 128123, 1, 79991234567, 4, 4);
INSERT INTO patients(surname, name, middle_name, date_birth, serial_doc, GENDER_ID, phone_number, area_id, user_id) values ('��������', '�������', '����������', '25.11.1988', 129923, 1, 79991234567, 5, 5);


INSERT INTO journal(patient_id, datetime, talon_id) VALUES (1, '30.09.2021', 1);
INSERT INTO journal(patient_id, datetime, talon_id) VALUES (2, '30.09.2021', 2);
INSERT INTO journal(patient_id, datetime, talon_id) VALUES (3, '30.09.2021', 3);
INSERT INTO journal(patient_id, datetime, talon_id, DELETE_DT) VALUES (4, '30.09.2021', 4, '29.09.2021');

insert into DOCTOR_SPECIALTIES(doctor_id, specialty_id) values (1, 1);
insert into DOCTOR_SPECIALTIES(doctor_id, specialty_id) values (1, 2);
insert into DOCTOR_SPECIALTIES(doctor_id, specialty_id) values (2, 3);
insert into DOCTOR_SPECIALTIES(doctor_id, specialty_id) values (2, 5);
insert into DOCTOR_SPECIALTIES(doctor_id, specialty_id) values (3, 1);
insert into DOCTOR_SPECIALTIES(doctor_id, specialty_id) values (4, 4);
insert into DOCTOR_SPECIALTIES(doctor_id, specialty_id) values (5, 1);
