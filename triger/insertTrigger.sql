CREATE OR REPLACE TRIGGER NEWINSERT
AFTER INSERT ON Employee
FOR EACH ROW

BEGIN
    INSERT INTO NEWINSERT VALUES(
        :NEW.e_id,
        :NEW.e_name,
        :NEW.e_address,
        :NEW.Salary
    );

END;
/