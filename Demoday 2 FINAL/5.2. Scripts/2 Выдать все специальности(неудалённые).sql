create or replace procedure chesnokov_se.speciality_by_doctor_id(in_id_doctor in number)
as
    v_arr_specialitys chesnokov_se.t_arr_speciality := chesnokov_se.t_arr_speciality();
begin
    select chesnokov_se.t_speciality(speciality_name => s.speciality_name,
                                     required_min_age => s.required_min_age,
                                     required_max_age => s.required_max_age)
    bulk collect into v_arr_specialitys
    from ( select distinct s.speciality_name, s.required_min_age, s.required_max_age
              from chesnokov_se.specialties s
              join chesnokov_se.doctor_specialties ds on s.id_specialty = ds.id_specialty
              join chesnokov_se.doctors d on ds.id_doctor = d.id_doctor
              join chesnokov_se.hospitals h on d.id_hospital = h.id_hospital
              where ((s.delete_dt is null) and (d.delete_dt is null) and (h.delete_dt is null))
                 and ((ds.id_doctor = in_id_doctor and in_id_doctor is not null) or in_id_doctor is null)
         ) s;
    if v_arr_specialitys.count>0 then
        for i in v_arr_specialitys.first..v_arr_specialitys.last
        loop
            declare
                v_item chesnokov_se.t_speciality := v_arr_specialitys(i);
            begin
                dbms_output.put_line(v_item.speciality_name);
            end;
        end loop;
    end if;
end;

begin
    speciality_by_doctor_id(null );
end;

