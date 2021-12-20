create or replace package chesnokov_se.test_pkg_patient
as

    --%suite


    --%test(тест на phone_number is null)
    procedure check_patient_phone_number_is_null;

    --%test(тест на foreign_key id_gender)
    --%throws(-01400)
    procedure check_patient_id_gender_constraint;

    --%test(тест на foreign_key id_user)
    --%throws(-01400)
    procedure check_patient_id_user_constraint;

    --%test(тест на foreign_key id_area)
    --%throws(-01400)
    procedure check_patient_id_area_constraint;

    --%test(тест на surname is not null)
    --%throws(-01400)
    procedure check_patient_surname_not_null;

end;


create or replace package body chesnokov_se.test_pkg_patient
as
    is_debug boolean := true;

    mock_patient_surname varchar2(100) := 'surname';
    mock_patient_name varchar2(100) := 'name';
    mock_patient_middle_name varchar2(100) := 'middle_name';
    mock_patient_date_birth date := add_months(sysdate, -(12*20));
    mock_patient_id_gender number := 1;
    mock_patient_phone_number number := 89123456789;
    mock_patient_id_area number := 1;
    mock_patient_id_user number := 1;


    procedure check_patient_phone_number_is_null
    as
    begin
        if is_debug then dbms_output.put_line($$plsql_unit_owner||'.'||$$plsql_unit||'.'||utl_call_stack.subprogram(1)(2)); end if;

        insert into chesnokov_se.patients(
            surname, name, middle_name, date_birth, id_gender, phone_number, id_area, id_user
        )
        values (
            mock_patient_surname,
            mock_patient_name,
            mock_patient_middle_name,
            mock_patient_date_birth,
            mock_patient_id_gender,
            null,
            mock_patient_id_area,
            mock_patient_id_user
        );
end;

    procedure check_patient_id_gender_constraint
    as
    begin
        if is_debug then dbms_output.put_line($$plsql_unit_owner||'.'||$$plsql_unit||'.'||utl_call_stack.subprogram(1)(2)); end if;

        insert into chesnokov_se.patients(
            surname, name, middle_name, date_birth, id_gender, phone_number, id_area, id_user
        )
        values (
            mock_patient_surname,
            mock_patient_name,
            mock_patient_middle_name,
            mock_patient_date_birth,
            null,
            mock_patient_phone_number,
            mock_patient_id_area,
            mock_patient_id_user
        );
    end;

    procedure check_patient_id_user_constraint
    as
    begin
        if is_debug then dbms_output.put_line($$plsql_unit_owner||'.'||$$plsql_unit||'.'||utl_call_stack.subprogram(1)(2)); end if;

        insert into chesnokov_se.patients(
            surname, name, middle_name, date_birth, id_gender, phone_number, id_area, id_user
        )
        values (
            mock_patient_surname,
            mock_patient_name,
            mock_patient_middle_name,
            mock_patient_date_birth,
            mock_patient_id_gender,
            mock_patient_phone_number,
            mock_patient_id_area,
            null
        );
    end;

    procedure check_patient_id_area_constraint
    as
    begin
        if is_debug then dbms_output.put_line($$plsql_unit_owner||'.'||$$plsql_unit||'.'||utl_call_stack.subprogram(1)(2)); end if;

        insert into chesnokov_se.patients(
            surname, name, middle_name, date_birth, id_gender, phone_number, id_area, id_user
        )
        values (
            mock_patient_surname,
            mock_patient_name,
            mock_patient_middle_name,
            mock_patient_date_birth,
            mock_patient_id_gender,
            mock_patient_phone_number,
            null,
            mock_patient_id_user
        );
    end;

    procedure check_patient_surname_not_null
    as
    begin
        if is_debug then dbms_output.put_line($$plsql_unit_owner||'.'||$$plsql_unit||'.'||utl_call_stack.subprogram(1)(2)); end if;

        insert into chesnokov_se.patients(
            surname, name, middle_name, date_birth, id_gender, phone_number, id_area, id_user
        )
        values (
            null,
            mock_patient_name,
            mock_patient_middle_name,
            mock_patient_date_birth,
            mock_patient_id_area,
            mock_patient_phone_number,
            mock_patient_id_gender,
            mock_patient_id_user
        );
    end;


end;


create or replace package chesnokov_se.test_pkg_doctor
as

    --%suite


    --%test(тест на foreign_key id_hospital)
    --%throws(-01400)
    procedure check_doctor_id_hospital_constraint;

    --%test(тест на foreign_key id_area)
    --%throws(-01400)
    procedure check_doctor_id_area_constraint;

    --%test(тест на foreign_key id_area)
    --%throws(-01400)
    procedure check_doctor_id_qualification_constraint;

    --%test(тест на surname is not null)
    --%throws(-01400)
    procedure check_doctor_doctor_name_not_null;

    --%test(тест на phone_number is null)
    procedure check_doctor_salary_is_null;

end;


create or replace package body chesnokov_se.test_pkg_doctor
as
    is_debug boolean := true;

    mock_doctor_id_hospital number := 1;
    mock_doctor_id_area number := 1;
    mock_doctor_id_qualification number := 1;
    mock_doctor_name varchar2(50) := 'doctor doctor doctor';
    mock_doctor_salary number := 100;
    mock_doctor_education varchar2(100) := 89123456789;



    procedure check_doctor_id_hospital_constraint
    as
    begin
        if is_debug then dbms_output.put_line($$plsql_unit_owner||'.'||$$plsql_unit||'.'||utl_call_stack.subprogram(1)(2)); end if;

        insert into chesnokov_se.doctors(
            id_hospital, id_area, id_qualification, doctor_name, salary, education
        )
        values (
        null,
        mock_doctor_id_area,
        mock_doctor_id_qualification,
        mock_doctor_name,
        mock_doctor_salary,
        mock_doctor_education
        );
    end;

    procedure check_doctor_id_area_constraint
    as
    begin
        if is_debug then dbms_output.put_line($$plsql_unit_owner||'.'||$$plsql_unit||'.'||utl_call_stack.subprogram(1)(2)); end if;

        insert into chesnokov_se.doctors(
            id_hospital, id_area, id_qualification, doctor_name, salary, education
        )
        values (
        mock_doctor_id_hospital,
        null,
        mock_doctor_id_qualification,
        mock_doctor_name,
        mock_doctor_salary,
        mock_doctor_education
        );
    end;

    procedure check_doctor_id_qualification_constraint
    as
    begin
        if is_debug then dbms_output.put_line($$plsql_unit_owner||'.'||$$plsql_unit||'.'||utl_call_stack.subprogram(1)(2)); end if;

        insert into chesnokov_se.doctors(
            id_hospital, id_area, id_qualification, doctor_name, salary, education
        )
        values (
        mock_doctor_id_hospital,
        mock_doctor_id_area,
        null,
        mock_doctor_name,
        mock_doctor_salary,
        mock_doctor_education
        );
    end;

    procedure check_doctor_doctor_name_not_null
    as
    begin
        if is_debug then dbms_output.put_line($$plsql_unit_owner||'.'||$$plsql_unit||'.'||utl_call_stack.subprogram(1)(2)); end if;

        insert into chesnokov_se.doctors(
            id_hospital, id_area, id_qualification, doctor_name, salary, education
        )
        values (
        mock_doctor_id_hospital,
        mock_doctor_id_area,
        mock_doctor_id_qualification,
        null,
        mock_doctor_salary,
        mock_doctor_education
        );
    end;

    procedure check_doctor_salary_is_null
    as
    begin
        if is_debug then dbms_output.put_line($$plsql_unit_owner||'.'||$$plsql_unit||'.'||utl_call_stack.subprogram(1)(2)); end if;

        insert into chesnokov_se.doctors(
            id_hospital, id_area, id_qualification, doctor_name, salary, education
        )
        values (
        mock_doctor_id_hospital,
        mock_doctor_id_area,
        mock_doctor_id_qualification,
        mock_doctor_name,
        null,
        mock_doctor_education
        );
end;


end;


create or replace package chesnokov_se.test_pkg_hospital
as

    --%suite


    --%test(тест на foreign_key id_organization)
    --%throws(-01400)
    procedure check_hospital_id_organization_constraint;

    --%test(тест на foreign_key id_type)
    --%throws(-01400)
    procedure check_hospital_id_type_constraint;

    --%test(тест на surname is not null)
    --%throws(-01400)
    procedure check_hospital_hospital_name_not_null;

    --%test(тест на phone_number is null)
    --%throws(-01400)
    procedure check_hospital_availability_is_not_null;

end;


create or replace package body chesnokov_se.test_pkg_hospital
as
    is_debug boolean := true;

    mock_hospital_hospital_name varchar2(60) := 'hospital';
    mock_hospital_id_organzation number := 1;
    mock_hospital_id_type number := 1;
    mock_hospital_availability number := 1;



    procedure check_hospital_id_organization_constraint
    as
    begin
        if is_debug then dbms_output.put_line($$plsql_unit_owner||'.'||$$plsql_unit||'.'||utl_call_stack.subprogram(1)(2)); end if;

        insert into chesnokov_se.hospitals(
            hospital_name, id_organization, id_type, availability
        )
        values (
        mock_hospital_hospital_name,
        null,
        mock_hospital_id_type,
        mock_hospital_availability
        );
    end;

    procedure check_hospital_id_type_constraint
    as
    begin
        if is_debug then dbms_output.put_line($$plsql_unit_owner||'.'||$$plsql_unit||'.'||utl_call_stack.subprogram(1)(2)); end if;

        insert into chesnokov_se.hospitals(
            hospital_name, id_organization, id_type, availability
        )
        values (
        mock_hospital_hospital_name,
        mock_hospital_id_organzation,
        null,
        mock_hospital_availability
        );
    end;

    procedure check_hospital_hospital_name_not_null
    as
    begin
        if is_debug then dbms_output.put_line($$plsql_unit_owner||'.'||$$plsql_unit||'.'||utl_call_stack.subprogram(1)(2)); end if;

        insert into chesnokov_se.hospitals(
            hospital_name, id_organization, id_type, availability
        )
        values (
        null,
        mock_hospital_id_organzation,
        mock_hospital_id_type,
        mock_hospital_availability
        );
    end;

    procedure check_hospital_availability_is_not_null
    as
    begin
        if is_debug then dbms_output.put_line($$plsql_unit_owner||'.'||$$plsql_unit||'.'||utl_call_stack.subprogram(1)(2)); end if;

        insert into chesnokov_se.hospitals(
            hospital_name, id_organization, id_type, availability
        )
        values (
        mock_hospital_hospital_name,
        mock_hospital_id_organzation,
        mock_hospital_id_type,
        null
        );
    end;


end;


create or replace package chesnokov_se.test_pkg_journal
as

    --%suite


    --%test(тест на foreign_key id_patient)
    --%throws(-01400)
    procedure check_journal_id_patient_constraint;

    --%test(тест на foreign_key id_talon)
    --%throws(-01400)
    procedure check_journal_id_talon_constraint;

    --%test(тест на datetime is not null)
    --%throws(-01400)
    procedure check_journal_datetime_not_null;

    --%test(тест на availability is null)
    --%throws(-01400)
    procedure check_journal_availability_is_not_null;

end;


create or replace package body chesnokov_se.test_pkg_journal
as
    is_debug boolean := true;

    mock_journal_id_patient number := 1;
    mock_journal_datetime date := sysdate;
    mock_journal_id_talon number := 1;
    mock_journal_availability number := 1;



    procedure check_journal_id_patient_constraint
    as
    begin
        if is_debug then dbms_output.put_line($$plsql_unit_owner||'.'||$$plsql_unit||'.'||utl_call_stack.subprogram(1)(2)); end if;

        insert into chesnokov_se.journal(
            id_patient, datetime, id_talon, availability
        )
        values (
        null,
        mock_journal_datetime,
        mock_journal_id_talon,
        mock_journal_availability
        );
    end;

    procedure check_journal_id_talon_constraint
    as
    begin
        if is_debug then dbms_output.put_line($$plsql_unit_owner||'.'||$$plsql_unit||'.'||utl_call_stack.subprogram(1)(2)); end if;

        insert into chesnokov_se.journal(
            id_patient, datetime, id_talon, availability
        )
        values (
        mock_journal_id_patient,
        mock_journal_datetime,
        null,
        mock_journal_availability
        );
    end;

    procedure check_journal_datetime_not_null
    as
    begin
        if is_debug then dbms_output.put_line($$plsql_unit_owner||'.'||$$plsql_unit||'.'||utl_call_stack.subprogram(1)(2)); end if;

        insert into chesnokov_se.journal(
            id_patient, datetime, id_talon, availability
        )
        values (
        mock_journal_id_patient,
        null,
        mock_journal_id_talon,
        mock_journal_availability
        );
    end;

    procedure check_journal_availability_is_not_null
    as
    begin
        if is_debug then dbms_output.put_line($$plsql_unit_owner||'.'||$$plsql_unit||'.'||utl_call_stack.subprogram(1)(2)); end if;

        insert into chesnokov_se.journal(
            id_patient, datetime, id_talon, availability
        )
        values (
        mock_journal_id_patient,
        mock_journal_datetime,
        mock_journal_id_talon,
        null
        );
    end;


end;


create or replace package chesnokov_se.test_pkg_function_by_id
as

    --%suite

    --%test(проверка получения по id)
    procedure check_id_doctor_by_id_talon;

    --%test(ошибка получения по id)
    --%throws(no_data_found)
    procedure failed_id_doctor_by_id_talon;

    --%test(проверка получения по id)
    procedure check_id_hospital_by_id_doctor;

    --%test(ошибка получения по id)
    --%throws(no_data_found)
    procedure failed_id_hospital_by_id_doctor;

end;


create or replace package body chesnokov_se.test_pkg_function_by_id
as
    is_debug boolean := true;


    procedure check_id_doctor_by_id_talon
    as
        mock_doctor_id_hospital number := 1;
        mock_doctor_id_area number := 1;
        mock_doctor_id_qualification number := 1;
        mock_doctor_name varchar2(50) := 'doctor doctor doctor';
        mock_doctor_salary number := 100;
        mock_doctor_education varchar2(100) := 89123456789;

        mock_talon_start_date date := sysdate;
        mock_talon_end_date date := add_months(sysdate, 1);
        mock_talon_id_doctor number;
        mock_talon_availability number := 1;
        mock_talon_id number;

        check_var number;
    begin
        if is_debug then dbms_output.put_line($$plsql_unit_owner||'.'||$$plsql_unit||'.'||utl_call_stack.subprogram(1)(2)); end if;

        insert into chesnokov_se.doctors(
            id_hospital, id_area, id_qualification, doctor_name, salary, education
        )
        values (
        mock_doctor_id_hospital,
        mock_doctor_id_area,
        mock_doctor_id_qualification,
        mock_doctor_name,
        mock_doctor_salary,
        mock_doctor_education
        )
        returning id_doctor into mock_talon_id_doctor;

        insert into chesnokov_se.talons(
            start_date, end_date, id_doctor, availability
        )
        values (
            mock_talon_start_date,
            mock_talon_end_date,
            mock_talon_id_doctor,
            mock_talon_availability
        )
        returning id_talon into mock_talon_id;



        check_var := chesnokov_se.ID_DOCTOR_BY_ID_TALON(mock_talon_id);

        TOOL_UT3.UT.EXPECT(check_var).TO_EQUAL(mock_talon_id_doctor);

    end;

    procedure failed_id_doctor_by_id_talon
    as
        check_var number;
    begin
        if is_debug then dbms_output.put_line($$plsql_unit_owner||'.'||$$plsql_unit||'.'||utl_call_stack.subprogram(1)(2)); end if;

        check_var := chesnokov_se.ID_DOCTOR_BY_ID_TALON(-1);
    end;

    procedure check_id_hospital_by_id_doctor
    as
        mock_doctor_id_hospital number;
        mock_doctor_id_area number := 1;
        mock_doctor_id_qualification number := 1;
        mock_doctor_name varchar2(50) := 'doctor doctor doctor';
        mock_doctor_salary number := 100;
        mock_doctor_education varchar2(100) := 89123456789;
        mock_doctor_id number;

        mock_hospital_hospital_name varchar2(60) := 'hospital';
        mock_hospital_id_organzation number := 1;
        mock_hospital_id_type number := 1;
        mock_hospital_availability number := 1;

        check_var number;
    begin
        if is_debug then dbms_output.put_line($$plsql_unit_owner||'.'||$$plsql_unit||'.'||utl_call_stack.subprogram(1)(2)); end if;

        insert into chesnokov_se.hospitals(
            hospital_name, id_organization, id_type, availability
        )
        values (
        mock_hospital_hospital_name,
        mock_hospital_id_organzation,
        mock_hospital_id_type,
        mock_hospital_availability
        )
        returning id_hospital into mock_doctor_id_hospital;

        insert into chesnokov_se.doctors(
            id_hospital, id_area, id_qualification, doctor_name, salary, education
        )
        values (
        mock_doctor_id_hospital,
        mock_doctor_id_area,
        mock_doctor_id_qualification,
        mock_doctor_name,
        mock_doctor_salary,
        mock_doctor_education
        )
        returning id_doctor into mock_doctor_id;

        check_var := chesnokov_se.ID_HOSPITAL_BY_ID_DOCTOR(mock_doctor_id);

        TOOL_UT3.UT.EXPECT(check_var).TO_EQUAL(mock_doctor_id_hospital);

    end;

    procedure failed_id_hospital_by_id_doctor
    as
        check_var number;
    begin
        if is_debug then dbms_output.put_line($$plsql_unit_owner||'.'||$$plsql_unit||'.'||utl_call_stack.subprogram(1)(2)); end if;

        check_var := chesnokov_se.ID_HOSPITAL_BY_ID_DOCTOR(-1);
    end;


end;
