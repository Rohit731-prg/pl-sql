set serveroutput on

prompt Enter Employee Id :
accept N

declare
    did emp.eid%type;
    dname emp.name%type;
    dage emp.age%type;
begin
    select eid, name, age 
    into did, dname, dage
    from emp
    where eid = &N;

    dbms_output.put_line('Employee id: ' || did);
    dbms_output.put_line('Employee name: ' || dname);
    dbms_output.put_line('Employee age: ' || dage);
end;
/
