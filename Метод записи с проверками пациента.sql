CREATE Function appointment(f_id_patient in number, f_datetime in date, f_id_talon in number)
   RETURN char
IS
   result_appointment char;
BEGIN
    if f_id_patient not in CHESNOKOV_SE.PATIENTS.ID_PATIENT
        then return 'Неверный ID пациента';
    end if;
    if f_id_patient not in CHESNOKOV_SE.TALONS.ID_TALON
        then return 'Неверный ID талона';
    end if;
    declare
        talon_time_begin date;
        talon_time_end date;
    begin
        select CHESNOKOV_SE.TALONS.START_DATE
            into talon_time_begin
            from  chesnokov_se.TALONS;
        select CHESNOKOV_SE.TALONS.END_DATE
            into talon_time_end
            from  chesnokov_se.TALONS;
        if f_datetime not between talon_time_begin and talon_time_end
            then return 'Неверный времядля указанного талона';
        end if;
    end;
    insert into CHESNOKOV_SE.JOURNAL(ID_PATIENT, DATETIME, ID_TALON, AVAILABILITY) values (f_id_patient, f_datetime, f_id_talon, 1);
    RETURN 'Строка успешна вставлена';
END appointment;