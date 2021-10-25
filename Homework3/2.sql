declare
    v_temp_char char(39);
    v_temp_number number;
    v_variable number := 1;
        cursor cursor_1 is
            select chesnokov_se.QUALIFICATIONS.QUALIFICATION_LEVEL
            from chesnokov_se.QUALIFICATIONS
            where (CHESNOKOV_SE.QUALIFICATIONS.ID_QUALIFICATION = v_variable and v_variable is not null) or (v_variable is null );
        cursor cursor_2 is
            select chesnokov_se.QUALIFICATIONS.QUALIFICATION_LEVEL
            from chesnokov_se.QUALIFICATIONS
            where  (CHESNOKOV_SE.QUALIFICATIONS.ID_QUALIFICATION = v_variable and v_variable is not null) or (v_variable is null );

    BEGIN
        OPEN cursor_1;
            LOOP
                FETCH cursor_1
                INTO v_temp_char;
                EXIT WHEN cursor_1%notfound;
                   dbms_output.put_line(v_temp_char);
            END LOOP;
        CLOSE cursor_1;
        OPEN cursor_2;
            LOOP
                FETCH cursor_2
                into v_temp_number;
                EXIT WHEN cursor_2%notfound;
                dbms_output.put_line(v_temp_number);
            END LOOP;
        CLOSE cursor_2;
    END;

