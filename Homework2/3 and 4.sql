declare
    v_variable_bool boolean;
begin
    if(v_variable_bool)
    then
        dbms_output.put_line('true');
    else
        dbms_output.put_line('false');
    end if;
end;