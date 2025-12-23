CREATE OR REPLACE TRIGGER UPDATEEMP
BEFORE UPDATE ON Employee
FOR EACH ROW

BEGIN
    INSERT INTO UPDATEEMP VALUES (
        :OLD.e_id,
        :OLD.e_name,
        :OLD.e_address,
        :OLD.Salary
    );

END;
/