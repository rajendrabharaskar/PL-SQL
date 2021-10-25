declare
    v_temp_char char(39);
    v_temp_number number;
    v_variable number := 1;
begin
    select chesnokov_se.QUALIFICATIONS.QUALIFICATION_LEVEL
    into v_temp_char
    from chesnokov_se.QUALIFICATIONS
    where CHESNOKOV_SE.QUALIFICATIONS.ID_QUALIFICATION = v_variable;
    select chesnokov_se.QUALIFICATIONS.QUALIFICATION_LEVEL
    into v_temp_number
    from chesnokov_se.QUALIFICATIONS
    where CHESNOKOV_SE.QUALIFICATIONS.ID_QUALIFICATION = v_variable;
    dbms_output.put_line(v_temp_char);
    dbms_output.put_line(v_temp_number);
end;


