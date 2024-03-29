create table chesnokov_se.regions
(
    id_region number generated by default as identity (start with 1) primary key,
    region_name char(120) not null
);


create table chesnokov_se.cities
(
    id_city number generated by default as identity (start with 1) primary key,
    city_name char(100) not null,
    id_region number not null
        references chesnokov_se.regions(id_region)
);


create table chesnokov_se.med_organizations
(
    id_med_organization number generated by default as identity (start with 1) primary key,
    organization_name char(120) not null,
    id_city number not null
        references chesnokov_se.cities(id_city)
);


create table chesnokov_se.types_hospital
(
    id_type number generated by default as identity (start with 1) primary key,
    type_name char(40) not null
);


create table chesnokov_se.areas
(
    id_area number generated by default as identity (start with 1) primary key,
    area_name char(70) not null
);


create table chesnokov_se.qualifications
(
    id_qualification number generated by default as identity (start with 1) primary key,
    qualification_name char(60) not null,
    qualification_level number not null
);


create table chesnokov_se.users
(
    id_user number generated by default as identity (start with 1) primary key,
    login char(50) not null
);


create table chesnokov_se.genders
(
    id_gender number generated by default as identity (start with 1) primary key,
    gender char(20) not null
);


create table chesnokov_se.specialties
(
    id_specialty number generated by default as identity (start with 1) primary key,
    speciality_name char(50) not null,
    required_min_age number not null,
    required_max_age number not null,
    delete_dt date,
    external_id number,
    source_id number
);


create table chesnokov_se.gender_specialties
(
    id_gender number not null
        references chesnokov_se.genders(id_gender),
    id_speciality number not null
        references chesnokov_se.specialties(id_specialty)
)


create table chesnokov_se.patients
(
    id_patient number generated by default as identity (start with 1) primary key,
    surname char(50) not null,
    name char(50) not null,
    middle_name char(50),
    date_birth date not null,
    id_gender number not null
        references chesnokov_se.genders(id_gender),
    phone_number number(11),
    id_area number not null
        references chesnokov_se.areas(id_area),
    id_user number not null
        references chesnokov_se.users(id_user)
);


create table chesnokov_se.documents
(
    id_document number generated by default as identity (start with 1) primary key,
    name char(50) not null
)


create table chesnokov_se.documents_numbers
(
    id_document_number number generated by default as identity (start with 1) primary key,
    id_patient number
        references  chesnokov_se.patients(id_patient),
    id_document number
        references  chesnokov_se.documents(id_document),
    value varchar2(50)
)


create table chesnokov_se.hospitals
(
    id_hospital number generated by default as identity (start with 1) primary key,
    hospital_name char(60) not null,
    id_organization number not null
        references chesnokov_se.med_organizations(id_med_organization),
    id_type number not null
        references chesnokov_se.types_hospital(id_type),
    delete_dt date,
    availability number not null,
    external_id number,
    source number
);


create table chesnokov_se.working_time
(
    id_time number generated by default as identity (start with 1) primary key,
    day number not null, -- номер дня недели
    begin_time timestamp not null,
    end_time timestamp not null,
    id_hospital number not null
        references  chesnokov_se.hospitals(id_hospital)
);


create table chesnokov_se.doctors
(
    id_doctor number generated by default as identity (start with 1) primary key,
    id_hospital number not null
        references chesnokov_se.hospitals(id_hospital),
    id_area number
        references chesnokov_se.areas(id_area),
    id_qualification number
        references chesnokov_se.qualifications(id_qualification),
    doctor_name char(50) not null,
    salary number,
    education varchar2(100),
    delete_dt date,
    external_id number,
    source number
);


create table reviews
(
    id_review number generated by default as identity (start with 1) primary key,
    id_doctor number not null
        references chesnokov_se.doctors(id_doctor),
    review varchar2(300),
    rating number not null
)


create table chesnokov_se.talons
(
    id_talon number generated by default as identity (start with 1) primary key,
    delete_dt date,
    start_date date not null,
    end_date date not null,
    id_doctor number not null
        references chesnokov_se.doctors(id_doctor),
    availability number not null
);


create table chesnokov_se.journal
(
    id_jornal number generated by default as identity (start with 1) primary key,
    id_patient number not null
        references chesnokov_se.patients(id_patient),
    datetime date not null,
    id_talon number not null
        references chesnokov_se.talons(id_talon),
    delete_dt date,
    availability number not null
);


create table chesnokov_se.doctor_specialties
(
    id_doctor number not null
        references chesnokov_se.doctors(id_doctor),
    id_specialty number not null
        references chesnokov_se.specialties(id_specialty)
);


create table chesnokov_se.error_logs
(
    id_log number generated by default as identity (start with 1) primary key,
    sh_user varchar2(50) default user,
    sh_dt date default sysdate,
    object_name varchar2(200),
    log_type varchar2(1000),
    params varchar2(4000)
);

