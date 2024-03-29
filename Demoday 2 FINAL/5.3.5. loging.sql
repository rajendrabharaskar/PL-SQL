create table chesnokov_se.error_logs
(
    id_log number generated by default as identity (start with 1) primary key,
    sh_user varchar2(50) default user,
    sh_dt date default sysdate,
    object_name varchar2(200),
    log_type varchar2(1000),
    params varchar2(4000)
)
partition by range (sh_dt) (
    partition error_logs_to_24_02_22 values less than (to_date('24.02.2022 00:00', 'dd.mm.yyyy hh24:mi')),
    partition error_logs_max values less than (maxvalue)
);


create or replace procedure chesnokov_se.add_error_log(
    p_object_name varchar2,
    p_params varchar2,
    p_log_type varchar2 default 'common'
)
as
pragma autonomous_transaction;
begin
    insert into chesnokov_se.error_logs(object_name, log_type, params)
    values (p_object_name, p_log_type, p_params);
    commit;
end;



select * from chesnokov_se.error_logs;



