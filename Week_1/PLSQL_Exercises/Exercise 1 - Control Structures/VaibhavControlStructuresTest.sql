CREATE TABLE accounts (
    customer_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(50),
    balance NUMBER,
    IsVIP VARCHAR2(5)
);

CREATE TABLE loans (
    loan_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    customer_age NUMBER,
    interest_rate NUMBER,
    due_date DATE
);




INSERT INTO accounts VALUES (101,'Vaibhav',15000,'FALSE');
INSERT INTO accounts VALUES (102,'Rahul',8000,'FALSE');
INSERT INTO accounts VALUES (103,'Anjali',25000,'FALSE');
INSERT INTO accounts VALUES (104,'Rohan',9500,'FALSE');

INSERT INTO loans VALUES (1,101,65,9,SYSDATE+15);
INSERT INTO loans VALUES (2,102,45,11,SYSDATE+45);
INSERT INTO loans VALUES (3,103,72,8,SYSDATE+10);
INSERT INTO loans VALUES (4,104,59,10,SYSDATE+90);

COMMIT;




-- scenario 1: apply a 1% discount to loan interest rates for customers above 60 years old

DECLARE
    -- here the cursor fetches customers older than 60 with active loans
    CURSOR c_senior_customers IS
        SELECT customer_id, interest_rate 
        FROM loans 
        WHERE customer_age > 60;
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- vaibhav mishras senior loan discount processing ---');
    FOR r_customer IN c_senior_customers LOOP
        UPDATE loans
        SET interest_rate = interest_rate - 1
        WHERE customer_id = r_customer.customer_id;
        
        DBMS_OUTPUT.PUT_LINE('applied 1 percent discount for customer id: ' || r_customer.customer_id);
    END LOOP;
    COMMIT;
END;
/

SELECT * FROM Loans;


-- scenario 2: promote customers with a balance over 10000 to vip status
DECLARE

    -- here cursor is used to fetch customers with high balances
    CURSOR c_vip_candidates IS
        SELECT customer_id, balance 
        FROM accounts 
        WHERE balance > 10000;
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- vaibhav mishras vip promotion processing ---');
    FOR r_vip IN c_vip_candidates LOOP
        UPDATE accounts
        SET IsVIP = 'TRUE'
        WHERE customer_id = r_vip.customer_id;
        
        DBMS_OUTPUT.PUT_LINE('promoted customer id to vip: ' || r_vip.customer_id);
    END LOOP;
    COMMIT;
END;
/


SELECT * FROM Accounts;



-- scenario 3: print reminders for customers whose loans are due within the next 30 days
DECLARE
    -- here I used the cursor to find loans due soon using sysdate
    CURSOR c_due_loans IS
        SELECT customer_id, loan_id, due_date 
        FROM loans 
        WHERE due_date BETWEEN SYSDATE AND SYSDATE + 30;
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- vaibhav mishras loan due reminder system ---');
    FOR r_loan IN c_due_loans LOOP
        DBMS_OUTPUT.PUT_LINE('reminder message sent to customer id ' || r_loan.customer_id || ' for loan id ' || r_loan.loan_id || ' due on ' || r_loan.due_date);
    END LOOP;
END;
/

SELECT * FROM Accounts;
SELECT * FROM Loans;




-- MY LEARNING NOTES FOR EXERCISE 1:  --


-- What I learnt through this:  

--   -> Learn how to use implicit cursor for loops to iterate through table rows without manually opening and closing them
--   -> Understood how date arithmetic works in pl/sql by adding days directly to the sysdate keyword for filtering records


-- Mistakes I did: //

--   -> At first i forgot to put the commit statement inside the update blocks so my changes were not showing up in the table after execution
--   -> I accidentally tried to assign a boolean true directly to a varchar column for the vip flag which threw a type mismatch error before i changed it to a string literal