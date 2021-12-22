create or replace function chesnokov_se.check_cancel_journal(
    in_id_journal number
)
    return boolean
as
    v_availability number;
begin
    select journal.availability
        into v_availability
        from chesnokov_se.journal
        where journal.id_jornal = in_id_journal;
    return v_availability != 0;
end;


create or replace function chesnokov_se.check_start_of_appointment(
    in_id_journal number
)
    return boolean
as
    v_date_appointment date;
begin
    select journal.datetime
        into v_date_appointment
        from chesnokov_se.journal
        where journal.id_jornal = in_id_journal;

    return v_date_appointment > sysdate;
end;


create or replace function check_ending_working_day(
    in_id_journal number
)
    return boolean
as
    v_end_time_hospital date;
begin
    select working_time.end_time
        into v_end_time_hospital
        from chesnokov_se.journal
        join talons on journal.id_talon = talons.id_talon
        join doctors on talons.id_doctor = doctors.id_doctor
        join working_time on doctors.id_hospital = working_time.id_hospital
        where chesnokov_se.journal.id_jornal = in_id_journal and working_time.day = day_of_week();

    return not ((sysdate - trunc(sysdate)) * 24) > (((v_end_time_hospital - trunc(v_end_time_hospital)) * 24) - 2);
end;

create or replace procedure cancel_appointment(v_id_journal number)
as
    result_output varchar2(300);
    id_talon_journal number;
begin
    if not check_cancel_journal(v_id_journal)
        then result_output := result_output || 'Запись уже отменена' || chr(10);
    end if;

    if not check_start_of_appointment(v_id_journal)
        then result_output := result_output || 'Приём уже начался' || chr(10);
    end if;

    if not check_ending_working_day(v_id_journal)
        then result_output := result_output || 'До окончания рабочего дня 2 часа' || chr(10);
    end if;

    if result_output is null
       then
            dbms_output.put_line('запись отменена');
            select chesnokov_se.journal.id_talon
                into id_talon_journal
                from chesnokov_se.journal
                where chesnokov_se.journal.id_jornal = v_id_journal;
            update talons
                set talons.availability = 1
                where chesnokov_se.talons.id_talon = id_talon_journal;
            update journal
                set journal.availability = 0
                where chesnokov_se.journal.id_jornal = id_talon_journal;
    else
        dbms_output.put_line(result_output);
    end if;
end;

