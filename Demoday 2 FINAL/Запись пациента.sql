create or replace procedure chesnokov_se.give_talon_time(
    in_id_talon in number,
    out_talon_time_begin out date,
    out_talon_time_end out date
)
as
begin
    select t.start_date
        into out_talon_time_begin
        from  chesnokov_se.talons t
        where t.id_talon = in_id_talon;
    select t.end_date
        into out_talon_time_end
        from  chesnokov_se.talons t
        where t.id_talon = in_id_talon;
end;


create or replace procedure chesnokov_se.check_time(
    in_id_talon number,
    in_datetime date
)
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
            dbms_standard.raise_application_error(-20000, 'не подходящее время для указанного талона');
    end if;

    if talon_time_begin <= sysdate
        then
            dbms_standard.raise_application_error(-20000, 'не подходящее время для указанного талона');
    end if;
end;


create or replace procedure chesnokov_se.check_registr_for_talon(
    in_id_talon number
)
as
    v_count number;
begin
    select count(j.id_patient)
        into v_count
        from chesnokov_se.journal j
        where j.id_talon = in_id_talon and j.availability = 1;
    if v_count > 0 then
        dbms_standard.raise_application_error(-20000, 'пациент уже записан на этот талон');
    end if;
end;


create or replace procedure chesnokov_se.check_availability_talon(
    in_id_talon number
)
as
    v_availability number;
begin
    select t.availability
        into v_availability
        from chesnokov_se.talons t
        where t.id_talon = in_id_talon;
    if v_availability != 1 then
        dbms_standard.raise_application_error(-20000, 'талон не доступен');
    end if;
end;


create or replace procedure chesnokov_se.check_exist_policy_oms(
    in_id_patient number
)
as
    v_count number;
begin
    select count(dn.id_document_number)
        into v_count
        from chesnokov_se.documents_numbers dn
        where dn.id_patient = in_id_patient and dn.id_document = 3;
    if v_count <= 0 then
        dbms_standard.raise_application_error(-20000, 'отсутствует полис омс');
    end if;
end;

create or replace function chesnokov_se.id_doctor_by_id_talon(
    in_id_talon number
)
    return number
as
    v_id_doctor number;
begin
    select t.id_doctor
        into v_id_doctor
        from chesnokov_se.talons t
        where t.id_talon = in_id_talon;
    return v_id_doctor;
end;


create or replace procedure chesnokov_se.check_gender(
    in_id_patient number,
    in_id_speciality number
)
as
    v_id_gender_patient number;
    v_count number;
begin
    select p.id_gender
        into v_id_gender_patient
        from chesnokov_se.patients p
        where p.id_patient = in_id_patient;

    select count(gs.id_gender)
        into v_count
        from chesnokov_se.gender_specialties gs
        where gs.id_gender = v_id_gender_patient and gs.id_speciality = in_id_speciality;

    if v_count <= 0 then
        dbms_standard.raise_application_error(-20000, 'не подходяший пол пациента');
    end if;
end;


create or replace procedure check_age(
    in_id_patient number,
    in_id_speciality number
)
as
    v_date_birth date;
    v_age_patient number;
    v_max_age number;
    v_min_age number;
begin
     select p.date_birth
        into v_date_birth
        from chesnokov_se.patients p
        where p.id_patient = in_id_patient;

    select months_between(trunc(sysdate),v_date_birth)/12
        into v_age_patient
        from dual;

    select s.required_min_age
        into v_min_age
        from chesnokov_se.specialties s
        where s.id_specialty = in_id_speciality;

    select s.required_max_age
        into v_max_age
        from chesnokov_se.specialties s
        where s.id_specialty = in_id_speciality;

    if not v_age_patient between v_min_age and v_max_age then
        dbms_standard.raise_application_error(-20000, 'не подходящий возраст пациента');
    end if;
end;


create or replace function id_hospital_by_id_doctor(
    in_id_doctor number
)
    return  number
as
    v_id_hospital number;
begin
    select d.id_hospital
        into v_id_hospital
        from chesnokov_se.doctors d
        where d.id_doctor = in_id_doctor;
    return v_id_hospital;
end;

create or replace procedure check_deleted(
    in_id_talon number,
    in_id_speciality number
)
as
    v_id_doctor number;
    v_id_hospital number;
    v_deleted date;
begin
    v_id_doctor := id_doctor_by_id_talon(in_id_talon);
    v_id_hospital := id_hospital_by_id_doctor(v_id_doctor);

    select d.delete_dt
        into v_deleted
        from chesnokov_se.doctors d
        where d.id_doctor = v_id_doctor;
    if v_deleted is not null then
       dbms_standard.raise_application_error(-20000, 'доктор не доступен');
    end if;

    select h.delete_dt
        into v_deleted
        from chesnokov_se.hospitals h
        where h.id_hospital = v_id_hospital;
    if v_deleted is not null then
       dbms_standard.raise_application_error(-20000, 'больница не доступна');
    end if;

    select s.delete_dt
        into v_deleted
        from chesnokov_se.specialties s
        where s.id_specialty = in_id_speciality;
    if v_deleted is not null then
       dbms_standard.raise_application_error(-20000, 'специальность не доступна');
    end if;
end;


create or replace procedure insert_in_journal(
    in_id_patient in number,
    in_datetime in date,
    in_id_talon number
)
as
begin
    insert into chesnokov_se.journal(id_patient, datetime, id_talon, availability) values (in_id_patient, in_datetime, in_id_talon, 1);
    update talons t
        set t.availability = 0
        where id_talon = in_id_talon;
    commit;
end;


create or replace procedure appointment(v_id_patient in number, v_datetime in date, v_id_talon in number, v_id_speciality in number)
as
begin
    check_time(v_id_talon, v_datetime);
    check_registr_for_talon(v_id_talon);
    check_availability_talon(v_id_talon);
    check_exist_policy_oms(v_id_patient);
    check_gender(v_id_patient, v_id_speciality);
    check_age(v_id_patient, v_id_speciality);
    check_deleted(v_id_talon, v_id_speciality);
    insert_in_journal(v_id_patient, v_datetime,v_id_talon);
    dbms_output.put_line('запись выполнена');
    exception
        when others then
        rollback;
        chesnokov_se.add_error_log($$plsql_unit_owner||'.'||$$plsql_unit,
            '{"error":"' || sqlerrm
            ||'","value":"' || v_id_patient || ',' || v_datetime || ',' || v_id_talon || ',' || v_id_speciality
            ||'","backtrace":"' || dbms_utility.format_error_backtrace()
            ||'"}');
        dbms_output.put_line(sqlerrm);
        commit;
end appointment;

begin
      chesnokov_se.appointment(1,to_date('27-12-2021 16:00','dd-mm-yyyy hh24:mi'),1 , 1);
end;