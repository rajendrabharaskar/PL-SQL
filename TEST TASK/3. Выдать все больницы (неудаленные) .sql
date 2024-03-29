declare
    v_today number;
begin
    select to_char (sysdate, 'D') into v_today from dual;

declare
    c_hospital_name HOSPITALS.HOSPITAL_NAME%type;
    c_availability HOSPITALS.AVAILABILITY%type;
    c_id_doctor number;
    c_type_name TYPES_HOSPITAL.TYPE_NAME%type;
    c_begin_time WORKING_TIME.BEGIN_TIME%type;
    c_end_time WORKING_TIMe.end_time%type;

    CURSOR curs is select HOSPITALS.HOSPITAL_NAME, HOSPITALS.AVAILABILITY, count(distinct DoCTORS.ID_DOCTOR) as "Количество врачей", TYPES_HOSPITAL.TYPE_NAME, WORKING_TIME.BEGIN_TIME, WORKING_TIME.END_TIME
    from hospitals
    join DOCTORS on HOSPITALS.ID_HOSPITAL = DOCTORS.ID_HOSPITAL
    right outer join DOCTOR_SPECIALTIES on DOCTORS.ID_DOCTOR = DOCTOR_SPECIALTIES.ID_DOCTOR
    join TYPES_HOSPITAL on HOSPITALS.ID_TYPE = TYPES_HOSPITAL.ID_TYPE
    join WORKING_TIME on (HOSPITALS.ID_HOSPITAL = WORKING_TIME.ID_HOSPITAL) and (WORKING_TIME.DAY = v_today)
    where (HOSPITALS.DELETE_DT is null) and (DOCTOR_SPECIALTIES.ID_SPECIALTY = 1)
    group by HOSPITAL_NAME, hospitals.AVAILABILITY, HOSPITALS.HOSPITAL_NAME, TYPES_HOSPITAL.ID_TYPE, TYPES_HOSPITAL.TYPE_NAME, WORKING_TIME.BEGIN_TIME, WORKING_TIME.END_TIME
    order by TYPES_HOSPITAL.ID_TYPE, count(distinct DOCTORS.ID_DOCTOR) desc, (case when to_char(sysdate, 'hh24:mi:ss') between to_char(WORKING_TIME.BEGIN_TIME, 'hh24:mi:ss') and to_char(WORKING_TIME.END_TIME, 'hh24:mi:ss' ) then 1 else 2 end);

    begin
    OPEN curs;
       LOOP
       FETCH curs into c_hospital_name, c_availability, c_id_doctor, c_type_name, c_begin_time, c_end_time ;
          EXIT WHEN curs%notfound;
          dbms_output.put_line(c_hospital_name || ' ' || c_availability || ' ' || c_id_doctor || ' ' ||c_type_name || ' ' || to_char(c_begin_time, 'hh24:mi:ss') || ' ' || to_char(c_end_time, 'hh24:mi:ss'));
       END LOOP;
       CLOSE curs;
    end;
end;