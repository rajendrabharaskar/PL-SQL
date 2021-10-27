declare
    type arraystring is varray(30) of varchar2(30);
    string arraystring;
    total number;
begin
    select CHESNOKOV_SE.AREAS.AREA_NAME
    bulk collect into string
    from AREAS;
    total := string.count;
    FOR i in 1 .. total LOOP
       dbms_output.put_line(string(i));
   END LOOP;
end;

