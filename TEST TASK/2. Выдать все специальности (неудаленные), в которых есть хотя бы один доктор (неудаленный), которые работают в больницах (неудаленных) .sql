SELECT DISTINCT SPECIALITY_NAME
FROM specialties
inner join DOCTOR_SPECIALTIES on SPECIALTIES.ID_SPECIALTY = DOCTOR_SPECIALTIES.ID_SPECIALTY
inner join DOCTORS on DOCTOR_SPECIALTIES.ID_DOCTOR = DOCTORS.ID_DOCTOR
inner join HOSPITALS on DOCTORS.ID_HOSPITAL= HOSPITALS.ID_HOSPITAL
WHERE (SPECIALTIES.DELETE_DT IS NULL) and (DOCTORS.DELETE_DT is null) and (HOSPITALS.DELETE_DT is null);




