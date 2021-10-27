INSERT INTO regions(region_name) VALUES ('Кемеровская область');
INSERT INTO regions(region_name) VALUES ('Московская область');
INSERT INTO regions(region_name) VALUES ('Новоибирская область');
INSERT INTO regions(region_name) VALUES ('Красноярская область');
INSERT INTO regions(region_name) VALUES ('Томская область');
INSERT INTO regions(region_name) VALUES ('Краснодарский край');
INSERT INTO regions(region_name) VALUES ('Ленинградская область');
INSERT INTO regions(region_name) VALUES ('Пермский край');
INSERT INTO regions(region_name) VALUES ('Приморский край');
INSERT INTO regions(region_name) VALUES ('Тверская область');


INSERT INTO cities(city_name, id_region) VALUES ('Юрга', 1);
INSERT INTO cities(city_name, id_region) VALUES ('Москва', 2);
INSERT INTO cities(city_name, id_region) VALUES ('Новосибирск', 3);
INSERT INTO cities(city_name, id_region) VALUES ('Красноярск', 4);
INSERT INTO cities(city_name, id_region) VALUES ('Томск', 5);
INSERT INTO cities(city_name, id_region) VALUES ('Краснодар', 6);
INSERT INTO cities(city_name, id_region) VALUES ('Санкт-Петербург', 7);
INSERT INTO cities(city_name, id_region) VALUES ('Пермь', 8);
INSERT INTO cities(city_name, id_region) VALUES ('Владивосток', 9);
INSERT INTO cities(city_name, id_region) VALUES ('Тверь', 10);


INSERT INTO med_organizations(organization_name, id_city) VALUES ('Премиум', 2);
INSERT INTO med_organizations(organization_name, id_city) VALUES ('Старт', 3);
INSERT INTO med_organizations(organization_name, id_city) VALUES ('Здоровье', 4);
INSERT INTO med_organizations(organization_name, id_city) VALUES ('Сердце', 5);
INSERT INTO med_organizations(organization_name, id_city) VALUES ('Доктор', 6);
INSERT INTO med_organizations(organization_name, id_city) VALUES ('Новелла', 7);
INSERT INTO med_organizations(organization_name, id_city) VALUES ('Health', 8);
INSERT INTO med_organizations(organization_name, id_city) VALUES ('Лечение', 9);
INSERT INTO med_organizations(organization_name, id_city) VALUES ('Альфа', 10);
INSERT INTO med_organizations(organization_name, id_city) VALUES ('Бета1', 10);


INSERT INTO types_hospital(type_name) VALUES ('Частная');
INSERT INTO types_hospital(type_name) VALUES ('Государственная');


insert into WORKING_TIME(day, begin_time, end_time, id_hospital) values (1,to_date('08:00:00','hh24:mi:ss'), to_date('18:00:00','hh24:mi:ss'), 1);
insert into WORKING_TIME(day, begin_time, end_time, id_hospital) values (2,to_date('08:00:00','hh24:mi:ss'), to_date('18:00:00','hh24:mi:ss'), 1);
insert into WORKING_TIME(day, begin_time, end_time, id_hospital) values (3,to_date('08:00:00','hh24:mi:ss'), to_date('18:00:00','hh24:mi:ss'), 1);
insert into WORKING_TIME(day, begin_time, end_time, id_hospital) values (4,to_date('08:00:00','hh24:mi:ss'), to_date('18:00:00','hh24:mi:ss'), 1);
insert into WORKING_TIME(day, begin_time, end_time, id_hospital) values (5,to_date('08:00:00','hh24:mi:ss'), to_date('18:00:00','hh24:mi:ss'), 1);
insert into WORKING_TIME(day, begin_time, end_time, id_hospital) values (6,to_date('08:00:00','hh24:mi:ss'), to_date('16:00:00','hh24:mi:ss'), 1);
insert into WORKING_TIME(day, begin_time, end_time, id_hospital) values (1,to_date('08:00:00','hh24:mi:ss'), to_date('18:00:00','hh24:mi:ss'), 2);
insert into WORKING_TIME(day, begin_time, end_time, id_hospital) values (2,to_date('08:00:00','hh24:mi:ss'), to_date('18:00:00','hh24:mi:ss'), 2);
insert into WORKING_TIME(day, begin_time, end_time, id_hospital) values (3,to_date('08:00:00','hh24:mi:ss'), to_date('18:00:00','hh24:mi:ss'), 2);
insert into WORKING_TIME(day, begin_time, end_time, id_hospital) values (4,to_date('08:00:00','hh24:mi:ss'), to_date('18:00:00','hh24:mi:ss'), 2);
insert into WORKING_TIME(day, begin_time, end_time, id_hospital) values (5,to_date('08:00:00','hh24:mi:ss'), to_date('18:00:00','hh24:mi:ss'), 2);
insert into WORKING_TIME(day, begin_time, end_time, id_hospital) values (6,to_date('08:00:00','hh24:mi:ss'), to_date('16:00:00','hh24:mi:ss'), 2);
insert into WORKING_TIME(day, begin_time, end_time, id_hospital) values (1,to_date('08:00:00','hh24:mi:ss'), to_date('18:00:00','hh24:mi:ss'), 3);
insert into WORKING_TIME(day, begin_time, end_time, id_hospital) values (2,to_date('08:00:00','hh24:mi:ss'), to_date('18:00:00','hh24:mi:ss'), 3);
insert into WORKING_TIME(day, begin_time, end_time, id_hospital) values (3,to_date('08:00:00','hh24:mi:ss'), to_date('18:00:00','hh24:mi:ss'), 3);
insert into WORKING_TIME(day, begin_time, end_time, id_hospital) values (4,to_date('08:00:00','hh24:mi:ss'), to_date('18:00:00','hh24:mi:ss'), 3);
insert into WORKING_TIME(day, begin_time, end_time, id_hospital) values (5,to_date('08:00:00','hh24:mi:ss'), to_date('18:00:00','hh24:mi:ss'), 3);
insert into WORKING_TIME(day, begin_time, end_time, id_hospital) values (6,to_date('08:00:00','hh24:mi:ss'), to_date('16:00:00','hh24:mi:ss'), 3);
insert into WORKING_TIME(day, begin_time, end_time, id_hospital) values (1,to_date('08:00:00','hh24:mi:ss'), to_date('18:00:00','hh24:mi:ss'), 4);
insert into WORKING_TIME(day, begin_time, end_time, id_hospital) values (2,to_date('08:00:00','hh24:mi:ss'), to_date('18:00:00','hh24:mi:ss'), 4);
insert into WORKING_TIME(day, begin_time, end_time, id_hospital) values (3,to_date('08:00:00','hh24:mi:ss'), to_date('18:00:00','hh24:mi:ss'), 4);
insert into WORKING_TIME(day, begin_time, end_time, id_hospital) values (4,to_date('08:00:00','hh24:mi:ss'), to_date('18:00:00','hh24:mi:ss'), 4);
insert into WORKING_TIME(day, begin_time, end_time, id_hospital) values (5,to_date('08:00:00','hh24:mi:ss'), to_date('18:00:00','hh24:mi:ss'), 4);
insert into WORKING_TIME(day, begin_time, end_time, id_hospital) values (1,to_date('08:00:00','hh24:mi:ss'), to_date('18:00:00','hh24:mi:ss'), 4);
insert into WORKING_TIME(day, begin_time, end_time, id_hospital) values (2,to_date('08:00:00','hh24:mi:ss'), to_date('18:00:00','hh24:mi:ss'), 5);
insert into WORKING_TIME(day, begin_time, end_time, id_hospital) values (3,to_date('08:00:00','hh24:mi:ss'), to_date('18:00:00','hh24:mi:ss'), 5);
insert into WORKING_TIME(day, begin_time, end_time, id_hospital) values (4,to_date('08:00:00','hh24:mi:ss'), to_date('18:00:00','hh24:mi:ss'), 5);
insert into WORKING_TIME(day, begin_time, end_time, id_hospital) values (5,to_date('08:00:00','hh24:mi:ss'), to_date('18:00:00','hh24:mi:ss'), 5);
insert into WORKING_TIME(day, begin_time, end_time, id_hospital) values (6,to_date('08:00:00','hh24:mi:ss'), to_date('16:00:00','hh24:mi:ss'), 5);

INSERT INTO hospitals(hospital_name, id_organization, id_type, AVAILABILITY) VALUES ('Больница №1', 2, 2, 1);
INSERT INTO hospitals(hospital_name, id_organization, id_type, delete_dt, AVAILABILITY) VALUES ('Больница №2', 3, 1, '28.09.2021', 1);
INSERT INTO hospitals(hospital_name, id_organization, id_type, AVAILABILITY) VALUES ('Больница №3', 4, 2, 1);
INSERT INTO hospitals(hospital_name, id_organization, id_type, AVAILABILITY) VALUES ('Больница №4', 5, 1, 1);
INSERT INTO hospitals(hospital_name, id_organization, id_type, AVAILABILITY) VALUES ('Больница №5', 6, 2, 1);


insert into genders(gender) values ('Мужской');
insert into genders(gender) values ('Женский');


INSERT INTO specialties(speciality_name, REQUIRED_MIN_AGE, REQUIRED_MAX_AGE) VALUES ('Хирург', 18, 120);
INSERT INTO specialties(speciality_name, REQUIRED_MIN_AGE, REQUIRED_MAX_AGE, DELETE_DT) VALUES ('Терапевт', 18, 120, '20.07.2021');
INSERT INTO specialties(speciality_name, REQUIRED_MIN_AGE, REQUIRED_MAX_AGE) VALUES ('ЛОР', 0, 120);
INSERT INTO specialties(speciality_name, REQUIRED_MIN_AGE, REQUIRED_MAX_AGE) VALUES ('Педиатр', 0, 18);
INSERT INTO specialties(speciality_name, REQUIRED_MIN_AGE, REQUIRED_MAX_AGE) VALUES ('Гинеколог', 0, 120);


insert into GENDER_SPECIALTIES(id_gender, id_speciality) values (1, 1);
insert into GENDER_SPECIALTIES(id_gender, id_speciality) values (2, 1);
insert into GENDER_SPECIALTIES(id_gender, id_speciality) values (1, 2);
insert into GENDER_SPECIALTIES(id_gender, id_speciality) values (2, 2);
insert into GENDER_SPECIALTIES(id_gender, id_speciality) values (1, 3);
insert into GENDER_SPECIALTIES(id_gender, id_speciality) values (2, 3);
insert into GENDER_SPECIALTIES(id_gender, id_speciality) values (1, 4);
insert into GENDER_SPECIALTIES(id_gender, id_speciality) values (2, 4);
insert into GENDER_SPECIALTIES(id_gender, id_speciality) values (2, 5);


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


INSERT INTO DOCTORS(id_hospital, id_area, id_qualification, doctor_name, salary, education) VALUES (1, 1, 3, 'Пермяков Иван', 70000, 'НГМУ');
INSERT INTO DOCTORS(id_hospital, id_area, id_qualification, doctor_name, salary, education, DELETE_DT) VALUES (2, 2, 4, 'Иванов Иван',65020,'НГМА' ,'15.06.2020');
INSERT INTO DOCTORS(id_hospital, id_area, id_qualification, doctor_name, salary, education) VALUES (3, 3, 5, 'Андреев Иван',65020,'НГМА');
INSERT INTO DOCTORS(id_hospital, id_area, id_qualification, doctor_name, salary, education) VALUES (4, 4, 5, 'Ступкин Иван',44530,'НГМА');
INSERT INTO DOCTORS(id_hospital, id_area, id_qualification, doctor_name, salary, education) VALUES (5, 5, 1, 'Резцов Дмитрий',45020,'НГМА');


Insert into REVIEWS(id_doctor, review, rating) values (1, 'Всё хорошо', 5);
Insert into REVIEWS(id_doctor, review, rating) values (1, 'Всё плохо', 1);
Insert into REVIEWS(id_doctor, review, rating) values (2, 'хам и грубиян!!!!!', 1);
Insert into REVIEWS(id_doctor, review, rating) values (3, 'неопытный, что-то на больничном', 4);
Insert into REVIEWS(id_doctor, rating) values (4, 5);
Insert into REVIEWS(id_doctor, rating) values (5, 5);
Insert into REVIEWS(id_doctor, rating) values (5, 5);
Insert into REVIEWS(id_doctor, rating) values (5, 5);
Insert into REVIEWS(id_doctor, rating) values (4,  5);




INSERT INTO TALONS(START_date, end_date, id_doctor, availability ) VALUES ('28.09.2021', '17.10.2021', 1, 1);
INSERT INTO TALONS(DELETE_DT, START_date, end_date, id_doctor, availability ) VALUES ('25.09.2021', '26.09.2021', '17.10.2021', 5, 1);
INSERT INTO TALONS(START_date, end_date, id_doctor, availability ) VALUES ('23.09.2021', '27.10.2021', 2, 1);
INSERT INTO TALONS(START_date, end_date, id_doctor, availability ) VALUES ('30.09.2021', '17.10.2021', 3, 1);
INSERT INTO TALONS(START_date, end_date, id_doctor, availability ) VALUES ('7.10.2021', '17.10.2021', 5, 1);


INSERT INTO USERS(login) VALUES ('user1');
INSERT INTO USERS(login) VALUES ('user2');
INSERT INTO USERS(login) VALUES ('student');
INSERT INTO USERS(login) VALUES ('lifer');
INSERT INTO USERS(login) VALUES ('rbq');


INSERT INTO patients(surname, name, middle_name, date_birth, id_gender, phone_number, id_area, id_user) values ('Тройский', 'Алексей', 'андреевич', '17.05.1995', 1, 79991234567, 1, 1);
INSERT INTO patients(surname, name, middle_name, date_birth, id_gender, phone_number, id_area, id_user) values ('Иванов', 'Алексей', 'андреевич', '07.03.1993', 1, 79991234567, 2, 2);
INSERT INTO patients(surname, name, middle_name, date_birth, id_gender, phone_number, id_area, id_user) values ('Петров', 'Алексей', 'андреевич', '13.04.1992', 1, 79991234567, 3, 3);
INSERT INTO patients(surname, name, middle_name, date_birth, id_gender, phone_number, id_area, id_user) values ('Баженов', 'Евгений', 'Владимирович', '24.05.1991', 1, 79991234567, 4, 4);
INSERT INTO patients(surname, name, middle_name, date_birth, id_gender, phone_number, id_area, id_user) values ('Куплинов', 'Дмитрий', 'Алексеевич', '25.11.1988', 1, 79991234567, 5, 5);


insert into DOCUMENTS(NAME) values ('Паспорт');
insert into DOCUMENTS(name) values ('СНИЛС');


INsert into DOCUMENTS_NUMBERS (ID_PATIENT, ID_DOCUMENT, VALUE) values (1,1,'3214 127223');
INsert into DOCUMENTS_NUMBERS (ID_PATIENT, ID_DOCUMENT, VALUE) values (1,2,'741963');
INsert into DOCUMENTS_NUMBERS (ID_PATIENT, ID_DOCUMENT, VALUE) values (2,1,'3211 849312');
INsert into DOCUMENTS_NUMBERS (ID_PATIENT, ID_DOCUMENT, VALUE) values (2,2,'946825');
INsert into DOCUMENTS_NUMBERS (ID_PATIENT, ID_DOCUMENT, VALUE) values (3,1,'2275 654821');
INsert into DOCUMENTS_NUMBERS (ID_PATIENT, ID_DOCUMENT, VALUE) values (3,2,'394567');
INsert into DOCUMENTS_NUMBERS (ID_PATIENT, ID_DOCUMENT, VALUE) values (4,1,'5826 753159');
INsert into DOCUMENTS_NUMBERS (ID_PATIENT, ID_DOCUMENT, VALUE) values (4,2,'785212');
INsert into DOCUMENTS_NUMBERS (ID_PATIENT, ID_DOCUMENT, VALUE) values (5,1,'9852 356322');
INsert into DOCUMENTS_NUMBERS (ID_PATIENT, ID_DOCUMENT, VALUE) values (5,2,'741236');

INSERT INTO journal(id_patient, datetime, id_talon, availability ) VALUES (1, '30.09.2021', 1, 1);
INSERT INTO journal(id_patient, datetime, id_talon, availability ) VALUES (2, '30.09.2021', 2, 1);
INSERT INTO journal(id_patient, datetime, id_talon, availability ) VALUES (3, '30.09.2021', 3, 1);
INSERT INTO journal(id_patient, datetime, id_talon, DELETE_DT, availability ) VALUES (4, '30.09.2021', 4, '29.09.2021', 1);

insert into DOCTOR_SPECIALTIES(id_doctor, id_specialty) values (1, 1);
insert into DOCTOR_SPECIALTIES(id_doctor, id_specialty) values (1, 2);
insert into DOCTOR_SPECIALTIES(id_doctor, id_specialty) values (2, 3);
insert into DOCTOR_SPECIALTIES(id_doctor, id_specialty) values (2, 5);
insert into DOCTOR_SPECIALTIES(id_doctor, id_specialty) values (3, 1);
insert into DOCTOR_SPECIALTIES(id_doctor, id_specialty) values (4, 4);
insert into DOCTOR_SPECIALTIES(id_doctor, id_specialty) values (5, 1);
