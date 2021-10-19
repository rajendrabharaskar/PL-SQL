declare
    v_char char(20):= 'Мужской';
    v_output number;
begin
    select ID_GENDER
    into v_output
    from CHESNOKOV_SE.GENDERS
    where GENDER = v_char;
    dbms_output.put_line(v_output);
end;