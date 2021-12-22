create or replace procedure chesnokov_se.give_talon_time(
    in_id_talon in number,
    out_talon_time_begin out date,
    out_talon_time_end out date
)
as
begin
    select talons.start_date
        into out_talon_time_begin
        from  chesnokov_se.talons
        where talons.id_talon = in_id_talon;
    select talons.end_date
        into out_talon_time_end
        from  chesnokov_se.talons
        where talons.id_talon = in_id_talon;
end;


create or replace function chesnokov_se.check_time(
    in_id_talon number,
    in_datetime date
)
    return boolean
as
    talon_time_begin date;
    talon_time_end date;
begin
    give_talon_time(
        in_id_talon => in_id_talon,
        out_talon_time_begin => talon_time_begin,
        out_talon_time_end => talon_time_end
    );

    if in_datetime not between talon_time_begin and talon_time_end
        then
            return false;
    end if;

    if talon_time_begin <= sysdate
        then
            return false;
    end if;

    return true;
end;


create or replace function chesnokov_se.check_registr_for_talon(
    in_id_talon number
)
    return boolean
as
    v_count number;
begin
    select count(chesnokov_se.journal.id_patient)
        into v_count
        from chesnokov_se.journal
        where journal.id_talon = in_id_talon and journal.availability = 1;
    return not v_count > 0;
end;


create or replace function  chesnokov_se.check_availability_talon(
    in_id_talon number
)
    return boolean
as
    v_availability number;
begin
    select talons.availability
        into v_availability
        from chesnokov_se.talons
        where talons.id_talon = in_id_talon;
    return v_availability = 1;
end;


create or replace function  chesnokov_se.check_exist_policy_OMS(
    in_id_patient number
)
    return boolean
as
    v_count number;
begin
    select count(documents_numbers.id_document_number)
        into v_count
        from chesnokov_se.documents_numbers
        where documents_numbers.id_patient = in_id_patient and documents_numbers.id_document = 3;
    return v_count > 0;
end;

create or replace function chesnokov_se.id_doctor_by_id_talon(
    in_id_talon number
)
    return number
as
    v_id_doctor number;
begin
    select talons.id_doctor
        into v_id_doctor
        from chesnokov_se.talons
        where talons.id_talon = in_id_talon;
    return v_id_doctor;
end;


create or replace function chesnokov_se.check_gender(
    in_id_patient number,
    in_id_speciality number
)
    return boolean
as
    v_id_gender_patient number;
    v_count number;
begin
    select patients.id_gender
        into v_id_gender_patient
        from chesnokov_se.patients
        where patients.id_patient = in_id_patient;

    select count(gender_specialties.id_gender)
        into v_count
        from chesnokov_se.gender_specialties
        where gender_specialties.id_gender = v_id_gender_patient and gender_specialties.id_speciality = in_id_speciality;

    return v_count > 0;
end;

create or replace function check_age(
    in_id_patient number,
    in_id_speciality number
)
    return boolean
as
    v_date_birth date;
    v_age_patient number;
    v_max_age number;
    v_min_age number;
begin
     select patients.date_birth
        into v_date_birth
        from chesnokov_se.patients
        where patients.id_patient = in_id_patient;

    select months_between(TRUNC(sysdate),v_date_birth)/12
        into v_age_patient
        from dual;

    select specialties.required_min_age
        into v_min_age
        from chesnokov_se.specialties
        where specialties.id_specialty = in_id_speciality;

    select specialties.required_max_age
        into v_max_age
        from chesnokov_se.specialties
        where specialties.id_specialty = in_id_speciality;

    return v_age_patient between v_min_age and v_max_age;
end;


create or replace function id_hospital_by_id_doctor(
    in_id_doctor number
)
    return  number
as
    v_id_hospital number;
begin
    select doctors.id_hospital
        into v_id_hospital
        from chesnokov_se.doctors
        where doctors.id_doctor = in_id_doctor;
    return v_id_hospital;
end;

create or replace function check_deleted(
    in_id_talon number,
    in_id_speciality number
)
    return boolean
as
    v_id_doctor number;
    v_id_hospital number;
    v_deleted date;
begin
    v_id_doctor := id_doctor_by_id_talon(in_id_talon);
    v_id_hospital := id_hospital_by_id_doctor(v_id_doctor);

    select doctors.delete_dt
        into v_deleted
        from chesnokov_se.doctors
        where doctors.id_doctor = v_id_doctor;
    if v_deleted is null
       then return false;
    end if;

    select hospitals.delete_dt
        into v_deleted
        from chesnokov_se.hospitals
        where hospitals.id_hospital = v_id_hospital;
    if v_deleted is null
       then return false;
    end if;

    select specialties.delete_dt
        into v_deleted
        from chesnokov_se.specialties
        where specialties.id_specialty = in_id_speciality;
    if v_deleted is null
       then return false;
    end if;

    return true;
end;


create or replace procedure insert_in_journal(
    in_id_patient in number,
    in_datetime in date,
    in_id_talon number
)
as
begin
    insert into CHESNOKOV_SE.JOURNAL(ID_PATIENT, DATETIME, ID_TALON, AVAILABILITY) values (in_id_patient, in_datetime, in_id_talon, 1);
    update TALONS
        set TALONS.AVAILABILITY = 0
        where ID_TALON = in_id_talon;
end;


create or replace procedure appointment(v_id_patient in number, v_datetime in date, v_id_talon in number, v_id_speciality in number)
as
    result_output varchar2(300);
BEGIN
    if not check_time(v_id_talon, v_datetime)
        then result_output := result_output || 'Не верное время' || chr(10);
    end if;

    if not check_registr_for_talon(v_id_talon)
        then result_output := result_output || 'Пациент уже записан в этот талон' || chr(10);
    end if;

    if not check_availability_talon(v_id_talon)
        then result_output := result_output || 'Талон закрыт' || chr(10);
    end if;

    if not check_exist_policy_OMS(v_id_patient)
        then result_output := result_output || 'Отсутствует полис ОМС' || chr(10);
    end if;

    if not check_gender(v_id_patient, v_id_speciality)
        then result_output := result_output || 'Неподходящий пол пациента для данной специальности' || chr(10);
    end if;

    if not check_age(v_id_patient, v_id_speciality)
        then result_output := result_output || 'Неподходящий возраст пациента для данной специальности' || chr(10);
    end if;

    if not check_deleted(v_id_talon, v_id_speciality)
        then result_output := result_output || 'Врач, специальность или больница удалены' || chr(10);
    end if;

    if result_output is null
        then
            insert_in_journal(v_id_patient, v_datetime,v_id_talon);
            dbms_output.put_line('Запись выполнена');
        else
            dbms_output.put_line(result_output);
    end if;
end appointment;

begin
      chesnokov_se.appointment(1,to_date('07-11-2021 16:00','DD-MM-YYYY HH24:MI'),6 , 1);
end;