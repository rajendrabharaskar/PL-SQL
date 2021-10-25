declare
    v_char char(20);
    v_output number:= 'Мужской';
    c_id_gender CHESNOKOV_SE.GENDERS.id_gender%type;
    cursor cursor1 is
            select ID_GENDER
        from CHESNOKOV_SE.GENDERS
        where (GENDER = v_char and v_char is not null) or v_char is null;
begin
    OPEN cursor1;
        LOOP
        FETCH cursor1 into c_id_gender;
           EXIT WHEN cursor1%notfound;
           dbms_output.put_line(c_id_gender );
        END LOOP;
        CLOSE cursor1;
end;