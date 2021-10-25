declare
    v_variable_bool boolean;
    v_id_city number := 1 ;
    c_city_name CITIES.CITY_NAME%type;
    c_id_region CITIES.ID_REGION%type;
    cursor cursor1 is
        select chesnokov_se.cities.city_name, CHESNOKOV_SE.CITIES.ID_REGION
        from chesnokov_se.cities
        where (CHESNOKOV_SE.CITIES.ID_CITY = v_id_city and v_id_city is not null) or v_id_city is null ;
begin
    if(v_variable_bool)
    then
        OPEN cursor1;
        LOOP
        FETCH cursor1 into c_city_name, c_id_region;
           EXIT WHEN cursor1%notfound;
           dbms_output.put_line(c_city_name || ' ' || c_id_region );
        END LOOP;
        CLOSE cursor1;
    else
        OPEN cursor1;
        LOOP
        FETCH cursor1 into c_city_name, c_id_region;
           EXIT WHEN cursor1%notfound;
           dbms_output.put_line(c_city_name);
        END LOOP;
        CLOSE cursor1;
    end if;
end;