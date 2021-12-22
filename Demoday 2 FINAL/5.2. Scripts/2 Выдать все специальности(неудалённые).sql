create or replace procedure chesnokov_se.speciality_by_doctor_id(in_id_doctor in number)
as
    v_speciality_name specialties.speciality_name%type;
    cursor c_specialties_by_doctor is
       select distinct s.speciality_name
            from chesnokov_se.specialties s
            join chesnokov_se.doctor_specialties ds on s.id_specialty = ds.id_specialty
            join chesnokov_se.doctors d on ds.id_doctor = d.id_doctor
            join chesnokov_se.hospitals h on d.id_hospital = h.id_hospital
            where ((s.delete_dt is null) and (d.delete_dt is null) and (h.delete_dt is null)) and ((ds.id_doctor = in_id_doctor and in_id_doctor is not null) or in_id_doctor is null);
begin
    open c_specialties_by_doctor;
        loop
        fetch c_specialties_by_doctor into v_speciality_name;
           exit when c_specialties_by_doctor%notfound;
           dbms_output.put_line(v_speciality_name);
        end loop;
    close c_specialties_by_doctor;
end;


begin
    speciality_by_doctor_id(null );
end;


