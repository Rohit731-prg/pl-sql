set serveroutput on
set verify off

prompt Enter Employee ID:
accept N_id number

declare
    v_tax number;
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
        if v_salary > 50000 then
            v_tax := v_salary * 20 / 100;
        elsif v_salary <= 50000 and v_salary > 40000 then
            v_tax := v_salary * 15 / 100;
        elsif v_salary <= 40000 and v_salary > 20000 then
            v_tax := v_salary * 10 / 100;

        end if;

        insert into tax_employee values(v_id, v_salary, v_tax);
        dbms_output.put_line('Employee ID: ' || v_name);
        dbms_output.put_line('Employee Salary: ' || v_salary);
        dbms_output.put_line('Employee Tax: ' || v_tax);
        dbms_output.put_line('Tax record is being inserted successfully.');

        end if;

EXCEPTION
    WHEN NO_DATA_FOUND then
        dbms_output.put_line('No data found for Employee ID: ' || &N_id);

end;
/
set verify on
set serveroutput off