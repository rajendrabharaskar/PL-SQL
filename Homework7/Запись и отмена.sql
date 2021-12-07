create or replace type chesnokov_se.t_return_result as object(
    code number,
    message varchar2(500),
    constructor function t_return_result
    (
        code number,
        message varchar2
    ) return self as result,
    member function get_code return varchar2,
    member function get_message return number
);

create or replace type body chesnokov_se.t_return_result
as
    constructor function t_return_result(
        code number,
        message varchar2
    ) return self as result
    as
    begin
        self.code := code;
        self.message:= message;
        return;
    end;

    member function get_code return number is
    begin
        return self.code;
    end;

    member function get_message return varchar2 is
    begin
        return self.message;
    end;
end;