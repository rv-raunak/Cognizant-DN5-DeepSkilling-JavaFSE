CREATE TABLE savings_accounts (
    account_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(50),
    balance NUMBER
);

CREATE TABLE employees (
    employee_id NUMBER PRIMARY KEY,
    employee_name VARCHAR2(50),
    department VARCHAR2(30),
    salary NUMBER
);

CREATE TABLE accounts (
    account_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(50),
    balance NUMBER
);




INSERT INTO savings_accounts VALUES (101,'Vaibhav',10000);
INSERT INTO savings_accounts VALUES (102,'Rahul',20000);
INSERT INTO savings_accounts VALUES (103,'Anjali',15000);

INSERT INTO employees VALUES (1,'Amit','IT',50000);
INSERT INTO employees VALUES (2,'Priya','IT',60000);
INSERT INTO employees VALUES (3,'Rohan','HR',45000);

INSERT INTO accounts VALUES (201,'Vaibhav',25000);
INSERT INTO accounts VALUES (202,'Rahul',18000);

COMMIT;




SELECT * FROM savings_accounts;
SELECT * FROM employees;
SELECT * FROM accounts;




-- scenario 1: process monthly interest for all savings accounts

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
IS
BEGIN

    -- here I am updating every savings account balance by adding 1 percent interest
    UPDATE savings_accounts
    SET balance = balance + (balance * 0.01);

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('monthly interest processed successfully.');

END;
/

BEGIN
    ProcessMonthlyInterest;
END;
/

SELECT * FROM savings_accounts;




-- scenario 2: update employee salary based on department and bonus percentage

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(

    p_department IN VARCHAR2,
    p_bonus_percentage IN NUMBER

)
IS
BEGIN

    -- here I am updating salary only for employees of the given department
    UPDATE employees
    SET salary = salary + (salary * p_bonus_percentage / 100)
    WHERE department = p_department;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('employee bonus updated successfully.');

END;
/

BEGIN
    UpdateEmployeeBonus('IT',10);
END;
/

SELECT * FROM employees;




-- scenario 3: transfer funds between two accounts

CREATE OR REPLACE PROCEDURE TransferFunds(

    p_from_account IN NUMBER,
    p_to_account IN NUMBER,
    p_amount IN NUMBER

)
IS

    v_balance NUMBER;

BEGIN

    -- here I first fetch the current balance of the sender account
    SELECT balance
    INTO v_balance
    FROM accounts
    WHERE account_id = p_from_account;

    IF v_balance >= p_amount THEN

        UPDATE accounts
        SET balance = balance - p_amount
        WHERE account_id = p_from_account;

        UPDATE accounts
        SET balance = balance + p_amount
        WHERE account_id = p_to_account;

        COMMIT;

        DBMS_OUTPUT.PUT_LINE('funds transferred successfully.');

    ELSE

        DBMS_OUTPUT.PUT_LINE('insufficient balance.');

    END IF;

END;
/

BEGIN
    TransferFunds(201,202,5000);
END;
/

SELECT * FROM accounts;




-- MY LEARNING NOTES FOR EXERCISE 3:  --


-- What I learnt through this:

--   -> Learnt how to create stored procedures using CREATE OR REPLACE PROCEDURE
--   -> Understood how procedure parameters are passed using the IN keyword
--   -> Learnt how to use local variables for storing values inside procedures
--   -> Practiced calling stored procedures using a BEGIN...END block


-- Mistakes I did: //

--   -> At first I forgot to execute the stored procedure after creating it so no changes were reflected in the tables
--   -> I forgot to use the INTO clause while selecting a value into a variable which resulted in an error
--   -> Initially I missed the COMMIT statement after updating records so the changes were not saved