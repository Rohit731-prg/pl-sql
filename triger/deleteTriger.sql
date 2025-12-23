CREATE OR REPLACE TRIGGER backupemp
BEFORE DELETE ON employee
FOR EACH ROW
BEGIN
    INSERT INTO backupemp
    VALUES (:OLD.e_id,
            :OLD.e_name,
            :OLD.e_address,
            :OLD.salary);
END;
/
