create or replace procedure chesnokov_se.check_cancel_journal(
    in_id_journal number
)
as
    v_availability number;
begin
    select j.availability
        into v_availability
        from chesnokov_se.journal j
        where j.id_jornal = in_id_journal;
    if v_availability = 0 then
        dbms_standard.raise_application_error(-20000, 'Запись уже отменена');
    end if;
end;


create or replace procedure chesnokov_se.check_start_of_appointment(
    in_id_journal number
)
as
    v_date_appointment date;
begin
    select j.datetime
        into v_date_appointment
        from chesnokov_se.journal j
        where j.id_jornal = in_id_journal;

    if v_date_appointment > sysdate then
        dbms_standard.raise_application_error(-20000, 'Приём уже начался');;
    end if;
end;


create or replace procedure check_ending_working_day(
    in_id_journal number
)
as
    v_end_time_hospital date;
begin
    select wt.end_time
        into v_end_time_hospital
        from chesnokov_se.journal j
        join talons t on j.id_talon = t.id_talon
        join doctors d on t.id_doctor = d.id_doctor
        join working_time wt on d.id_hospital = wt.id_hospital
        where chesnokov_se.journal.id_jornal = in_id_journal and wt.day = day_of_week();

    if not ((sysdate - trunc(sysdate)) * 24) > (((v_end_time_hospital - trunc(v_end_time_hospital)) * 24) - 2) then
        dbms_standard.raise_application_error(-20000, 'До окончания рабочего дня 2 часа');
    end if;
end;

create or replace procedure cancel_appointment(v_id_journal number)
as
    id_talon_journal number;
begin
    check_cancel_journal(v_id_journal);
    check_start_of_appointment(v_id_journal);
    check_ending_working_day(v_id_journal);
    select j.id_talon
        into id_talon_journal
        from chesnokov_se.journal j
        where j.id_jornal = v_id_journal;

    update chesnokov_se.talons t
        set t.availability = 1
        where t.id_talon = id_talon_journal;

    update chesnokov_se.journal j
        set j.availability = 0
        where j.id_jornal = id_talon_journal;
    commit;
    dbms_output.put_line('запись отменена');
    exception
        when others then
        rollback;
        chesnokov_se.add_error_log($$plsql_unit_owner||'.'||$$plsql_unit,
            '{"error":"' || sqlerrm
            ||'","value":"' || v_id_journal
            ||'","backtrace":"' || dbms_utility.format_error_backtrace()
            ||'"}');
        dbms_output.put_line(sqlerrm);
        commit;
end;

