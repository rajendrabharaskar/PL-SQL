INSERT INTO region(region_name) VALUES ('Кемеровская область');
INSERT INTO region(region_name) VALUES ('Московская область');
INSERT INTO region(region_name) VALUES ('Новоибирская область');
INSERT INTO region(region_name) VALUES ('Красноярская область');
INSERT INTO region(region_name) VALUES ('Томская область');
INSERT INTO region(region_name) VALUES ('Краснодарский край');
INSERT INTO region(region_name) VALUES ('Ленинградская область');
INSERT INTO region(region_name) VALUES ('Пермский край');
INSERT INTO region(region_name) VALUES ('Приморский край');
INSERT INTO region(region_name) VALUES ('Тверская область');


INSERT INTO cities(city_name, region_id) VALUES ('Юрга', 1);
INSERT INTO cities(city_name, region_id) VALUES ('Москва', 2);
INSERT INTO cities(city_name, region_id) VALUES ('Новосибирск', 3);
INSERT INTO cities(city_name, region_id) VALUES ('Красноярск', 4);
INSERT INTO cities(city_name, region_id) VALUES ('Томск', 5);
INSERT INTO cities(city_name, region_id) VALUES ('Краснодар', 6);
INSERT INTO cities(city_name, region_id) VALUES ('Санкт-Петербург', 7);
INSERT INTO cities(city_name, region_id) VALUES ('Пермь', 8);
INSERT INTO cities(city_name, region_id) VALUES ('Владивосток', 9);
INSERT INTO cities(city_name, region_id) VALUES ('Тверь', 10);


INSERT INTO med_organization(organization_name, city_id) VALUES ('Премиум', 2);
INSERT INTO med_organization(organization_name, city_id) VALUES ('Старт', 3);
INSERT INTO med_organization(organization_name, city_id) VALUES ('Здоровье', 4);
INSERT INTO med_organization(organization_name, city_id) VALUES ('Сердце', 5);
INSERT INTO med_organization(organization_name, city_id) VALUES ('Доктор', 6);
INSERT INTO med_organization(organization_name, city_id) VALUES ('Новелла', 7);
INSERT INTO med_organization(organization_name, city_id) VALUES ('Health', 8);
INSERT INTO med_organization(organization_name, city_id) VALUES ('Лечение', 9);
INSERT INTO med_organization(organization_name, city_id) VALUES ('Альфа', 10);
INSERT INTO med_organization(organization_name, city_id) VALUES ('Бета1', 10);


INSERT INTO types_hospital(type_name) VALUES ('Частная');
INSERT INTO types_hospital(type_name) VALUES ('Государственная');


insert into PROFILE_WORKING_HOURS(monday_start_time, monday_end_time, tuesday_start_time, tuesday_end_time, wednesday_start_time, wednesday_end_time, thursday_start_time, thursday_end_time, friday_start_time, friday_end_time, saturday_start_time, saturday_end_time, sunday_start_time, sunday_end_time) values (28800, 64800, 28800, 64800, 28800, 64800, 28800, 64800, 28800, 64800, 28800, 64800, 28800, 64800);


INSERT INTO hospitals(hospital_name, organization_id, type_id, WORKING_HOURS_ID, AVAILABILITY) VALUES ('Больница №1', 2, 2, 1,'true');
INSERT INTO hospitals(hospital_name, organization_id, type_id, WORKING_HOURS_ID, delete_dt, AVAILABILITY) VALUES ('Больница №2', 3, 1, 1, '28.09.2021', 'true');
INSERT INTO hospitals(hospital_name, organization_id, type_id, WORKING_HOURS_ID, AVAILABILITY) VALUES ('Больница №3', 4, 2, 1, 'true');
INSERT INTO hospitals(hospital_name, organization_id, type_id, WORKING_HOURS_ID, AVAILABILITY) VALUES ('Больница №4', 5, 1, 1, 'true');
INSERT INTO hospitals(hospital_name, organization_id, type_id, WORKING_HOURS_ID, AVAILABILITY) VALUES ('Больница №5', 6, 2, 1, 'true');


insert into gender(gender) values ('Мужской');
insert into gender(gender) values ('Женский');
insert into gender(gender) values ('Любой');


INSERT INTO specialties(speciality_name, REQUIRED_GENDER_ID, REQUIRED_MIN_AGE, REQUIRED_MAX_AGE) VALUES ('Хирург', 3, 18, 120);
INSERT INTO specialties(speciality_name, REQUIRED_GENDER_ID, REQUIRED_MIN_AGE, REQUIRED_MAX_AGE, DELETE_DT) VALUES ('Терапевт', 3, 18, 120, '20.07.2021');
INSERT INTO specialties(speciality_name, REQUIRED_GENDER_ID, REQUIRED_MIN_AGE, REQUIRED_MAX_AGE) VALUES ('ЛОР', 3, 0, 120);
INSERT INTO specialties(speciality_name, REQUIRED_GENDER_ID, REQUIRED_MIN_AGE, REQUIRED_MAX_AGE) VALUES ('Педиатр', 3, 0, 18);
INSERT INTO specialties(speciality_name, REQUIRED_GENDER_ID, REQUIRED_MIN_AGE, REQUIRED_MAX_AGE) VALUES ('Гинеколог', 2, 0, 120);


INSERT INTO qualifications(qualification_name, QUALIFICATION_LEVEL) VALUES ('Эксперт', 5);
INSERT INTO qualifications(qualification_name, QUALIFICATION_LEVEL) VALUES ('Новичок', 1);
INSERT INTO qualifications(qualification_name, QUALIFICATION_LEVEL) VALUES ('Средний', 2);
INSERT INTO qualifications(qualification_name, QUALIFICATION_LEVEL) VALUES ('Опытный', 3);
INSERT INTO qualifications(qualification_name, QUALIFICATION_LEVEL) VALUES ('Профессор', 4);


INSERT INTO AREAS(area_name) VALUES ('Первый');
INSERT INTO AREAS(area_name) VALUES ('Второй');
INSERT INTO AREAS(area_name) VALUES ('Третий');
INSERT INTO AREAS(area_name) VALUES ('Четвертый');
INSERT INTO AREAS(area_name) VALUES ('Пятый');


INSERT INTO DOCTORS(hospital_id, area_id, qualification_id, doctor_name) VALUES (1, 1, 3, 'Пермяков Иван');
INSERT INTO DOCTORS(hospital_id, area_id, qualification_id, doctor_name, DELETE_DT) VALUES (2, 2, 4, 'Иванов Иван', '15.06.2020');
INSERT INTO DOCTORS(hospital_id, area_id, qualification_id, doctor_name) VALUES (3, 3, 5, 'Андреев Иван');
INSERT INTO DOCTORS(hospital_id, area_id, qualification_id, doctor_name) VALUES (4, 4, 5, 'Ступкин Иван');
INSERT INTO DOCTORS(hospital_id, area_id, qualification_id, doctor_name) VALUES (5, 5, 1, 'Резцов Дмитрий');


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


INSERT INTO patients(surname, name, middle_name, date_birth, serial_doc, gender_id, phone_number, area_id, user_id) values ('Тройский', 'Алексей', 'андреевич', '17.05.1995', 123433, 1, 79991234567, 1, 1);
INSERT INTO patients(surname, name, middle_name, date_birth, serial_doc, GENDER_ID, phone_number, area_id, user_id) values ('Иванов', 'Алексей', 'андреевич', '07.03.1993', 123663, 1, 79991234567, 2, 2);
INSERT INTO patients(surname, name, middle_name, date_birth, serial_doc, GENDER_ID, phone_number, area_id, user_id) values ('Петров', 'Алексей', 'андреевич', '13.04.1992', 127723, 1, 79991234567, 3, 3);
INSERT INTO patients(surname, name, middle_name, date_birth, serial_doc, GENDER_ID, phone_number, area_id, user_id) values ('Баженов', 'Евгений', 'Владимирович', '24.05.1991', 128123, 1, 79991234567, 4, 4);
INSERT INTO patients(surname, name, middle_name, date_birth, serial_doc, GENDER_ID, phone_number, area_id, user_id) values ('Куплинов', 'Дмитрий', 'Алексеевич', '25.11.1988', 129923, 1, 79991234567, 5, 5);


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
