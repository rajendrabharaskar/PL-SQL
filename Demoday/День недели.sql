create function chesnokov_se.day_of_week
return number
as
    v_today number;
begin
    select to_char (sysdate, 'd') into v_today from dual;
    return v_today;
end;

