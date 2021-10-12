create table CHESNOKOV_SE.region
(
    region_id number GENERATED BY DEFAULT AS IDENTITY (START WITH 1) NOT NULL PRIMARY KEY,
    region_name char(120) not null
);


create table CHESNOKOV_SE.cities
(
    city_id number GENERATED BY DEFAULT AS IDENTITY (START WITH 1) NOT NULL PRIMARY KEY,
    city_name char(100) not null,
    region_id number not null
        references CHESNOKOV_SE.region(region_id)
);


create table CHESNOKOV_SE.med_organization
(
    med_organization_id number GENERATED BY DEFAULT AS IDENTITY (START WITH 1) NOT NULL PRIMARY KEY,
    organization_name char(120) not null,
    city_id number not null
        references CHESNOKOV_SE.cities(city_id)
);


create table CHESNOKOV_SE.types_hospital
(
    type_id number GENERATED BY DEFAULT AS IDENTITY (START WITH 1) NOT NULL PRIMARY KEY,
    type_name char(40) not null
);


create table CHESNOKOV_SE.areas
(
    area_id number GENERATED BY DEFAULT AS IDENTITY (START WITH 1) NOT NULL PRIMARY KEY,
    area_name char(70) not null
);


create table CHESNOKOV_SE.qualifications
(
    qualification_id number GENERATED BY DEFAULT AS IDENTITY (START WITH 1) NOT NULL PRIMARY KEY,
    qualification_name char(60) not null,
    qualification_level number not null
);


create table CHESNOKOV_SE.users
(
    user_id number GENERATED BY DEFAULT AS IDENTITY (START WITH 1) NOT NULL PRIMARY KEY,
    login char(50) not null
);


create table CHESNOKOV_SE.gender
(
    gender_id number GENERATED BY DEFAULT AS IDENTITY (START WITH 1) NOT NULL PRIMARY KEY,
    gender char(20) not null
);


create table CHESNOKOV_SE.specialties
(
    specialty_id number GENERATED BY DEFAULT AS IDENTITY (START WITH 1) NOT NULL PRIMARY KEY,
    speciality_name char(50) not null,
    required_gender_id number not null
        references CHESNOKOV_SE.gender(gender_id),
    required_min_age number not null,
    required_max_age number not null,
    delete_dt date
);


create table CHESNOKOV_SE.patients
(
    patient_id number GENERATED BY DEFAULT AS IDENTITY (START WITH 1) NOT NULL PRIMARY KEY,
    surname char(50) not null,
    name char(50) not null,
    middle_name char(50),
    date_birth date not null,
    serial_doc number not null,
    gender_id number not null
        references CHESNOKOV_SE.gender(gender_id),
    phone_number number(11),
    area_id number not null
        references CHESNOKOV_SE.areas(area_id),
    user_id number not null
        references CHESNOKOV_SE.users(user_id)
);


create table CHESNOKOV_SE.profile_working_hours
(
    profile_working_hours_id number GENERATED BY DEFAULT AS IDENTITY (START WITH 1) NOT NULL PRIMARY KEY,
    monday_start_time number not null, -- время в секундах
    monday_end_time number not null, -- время в секундах
    tuesday_start_time number not null, -- время в секундах
    tuesday_end_time number not null, -- время в секундах
    wednesday_start_time number not null, -- время в секундах
    wednesday_end_time number not null, -- время в секундах
    thursday_start_time number not null, -- время в секундах
    thursday_end_time number not null, -- время в секундах
    friday_start_time number not null, -- время в секундах
    friday_end_time number not null, -- время в секундах
    saturday_start_time number not null, -- время в секундах
    saturday_end_time number not null, -- время в секундах
    sunday_start_time number not null, -- время в секундах
    sunday_end_time number not null -- время в секундах
);


create table CHESNOKOV_SE.hospitals
(
    hospital_id number GENERATED BY DEFAULT AS IDENTITY (START WITH 1) NOT NULL PRIMARY KEY,
    hospital_name char(60) not null,
    organization_id number not null
        references CHESNOKOV_SE.med_organization(med_organization_id),
    type_id number not null
        references CHESNOKOV_SE.types_hospital(type_id),
    working_hours_id number not null
        references CHESNOKOV_SE.profile_working_hours(profile_working_hours_id),
    delete_dt date
);


create table CHESNOKOV_SE.doctors
(
    doctor_id number GENERATED BY DEFAULT AS IDENTITY (START WITH 1) NOT NULL PRIMARY KEY,
    hospital_id number not null
        references CHESNOKOV_SE.hospitals(hospital_id),
    area_id number not null
        references CHESNOKOV_SE.areas(area_id),
    qualification_id number not null
        references CHESNOKOV_SE.qualifications(qualification_id),
    doctor_name char(50) not null,
    delete_dt date
);


create table CHESNOKOV_SE.talons
(
    talon_id number GENERATED BY DEFAULT AS IDENTITY (START WITH 1) NOT NULL PRIMARY KEY,
    delete_dt date,
    start_date date not null,
    end_date date not null,
    doctor_id number not null
        references CHESNOKOV_SE.doctors(doctor_id)
);


create table CHESNOKOV_SE.journal
(
    jornal_id number GENERATED BY DEFAULT AS IDENTITY (START WITH 1) NOT NULL PRIMARY KEY,
    patient_id number not null
        references CHESNOKOV_SE.patients(patient_id),
    datetime date not null,
    talon_id number not null
        references CHESNOKOV_SE.talons(talon_id),
    delete_dt date
);


create table CHESNOKOV_SE.doctor_specialties
(
    doctor_id number not null
        references CHESNOKOV_SE.doctors(doctor_id),
    specialty_id number not null
        references CHESNOKOV_SE.specialties(specialty_id)
);


