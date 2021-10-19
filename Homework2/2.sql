declare
    v_temp_char char(39);
    v_temp_number number;
begin
    select chesnokov_se.QUALIFICATIONS.QUALIFICATION_LEVEL
    into v_temp_char
    from chesnokov_se.QUALIFICATIONS
    where CHESNOKOV_SE.QUALIFICATIONS.ID_QUALIFICATION = 1;
    select chesnokov_se.QUALIFICATIONS.QUALIFICATION_LEVEL
    into v_temp_number
    from chesnokov_se.QUALIFICATIONS
    where CHESNOKOV_SE.QUALIFICATIONS.ID_QUALIFICATION = 1;
    dbms_output.put_line(v_temp_char);
    dbms_output.put_line(v_temp_number);
end;


