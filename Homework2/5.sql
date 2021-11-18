declare
    datetime1 date := '01.07.2020';
    datetime2 date := '01.07.2022';
    type arraystring is varray(30) of varchar2(30);
    string arraystring;
    total number;
begin
    select id_talon
    into string
    from CHESNOKOV_SE.TALONS
    where END_DATE between datetime1 and datetime2;
    total := string.count;
    FOR i in 1 .. total LOOP
       dbms_output.put_line(string(i));
   END LOOP;
end;



