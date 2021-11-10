create or replace procedure chesnokov_se.speciality_by_doctor_id(in_id_doctor in number)
as
    v_speciality_name specialties.speciality_name%type;
    cursor c_specialties_by_doctor is
       select distinct specialties.speciality_name
            from chesnokov_se.specialties
            join chesnokov_se.doctor_specialties on specialties.id_specialty = doctor_specialties.id_specialty
            join chesnokov_se.doctors on doctor_specialties.id_doctor = doctors.id_doctor
            join chesnokov_se.hospitals on doctors.id_hospital = hospitals.id_hospital
            where ((specialties.delete_dt is null) and (doctors.delete_dt is null) and (hospitals.delete_dt is null)) and ((chesnokov_se.doctor_specialties.id_doctor = in_id_doctor and in_id_doctor is not null) or in_id_doctor is null);
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


