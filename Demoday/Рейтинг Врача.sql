create or replace function chesnokov_se.doctor_rating(in_id_doctor number)
    return number
as
    rating number;
begin
    select avg(chesnokov_se.reviews.rating)
        into rating
        from chesnokov_se.reviews
        where chesnokov_se.reviews.id_doctor = in_id_doctor;
    return rating;
end;


begin
    dbms_output.put_line(doctor_rating(4));
end;