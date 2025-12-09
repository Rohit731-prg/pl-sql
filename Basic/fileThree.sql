set serveroutput on;
set verify off

prompt Enter Employee ID:
accept N_id number

declare
    v_id employee.e_id%type;
    v_name employee.e_name%type;
    v_address employee.e_address%type;
    v_salary employee.salary%type;

begin
    select e_id, e_name, e_address, salary
    into v_id, v_name, v_address, v_salary
    from employee
    where e_id = &N_id;

    if SQL%ROWCOUNT > 0 then
        insert into newemp values(v_id, v_name, v_address, v_salary);
    dbms_output.put_line('Employee ID: ' || v_id);
    dbms_output.put_line('Employee Name: ' || v_name);
    dbms_output.put_line('Employee Address: ' || v_address);
    dbms_output.put_line('Employee Salary: ' || v_salary);
    dbms_output.put_line('Record is being transfer successfully.');

    end if;



EXCEPTION
    when NO_DATA_FOUND then
        dbms_output.put_line('No data found for Employee ID: ' || &N_id);

end;
/
set verify on
set serveroutput off