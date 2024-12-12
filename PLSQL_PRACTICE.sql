DECLARE
BEGIN
DBMS_OUTPUT.PUT_LINE('MOUNIKA');--ananymous block
END;
/

SET SERVEROUTPUT ON;
/

CREATE OR REPLACE PROCEDURE P2 IS 
V1 NUMBER:=2;
V2 NUMBER:=4;
v3 number;

BEGIN


v3:=v1+v2;
DBMS_OUTPUT.PUT_LINE('V1+V2:='||V3);
END;
/
SHOW ERRORS;
/
SELECT NAME,TYPE,SEQUENCE,LINE,POSITION,TEXT,ATTRIBUTE,MESSAGE_NUMBER FROM USER_ERRORS;
/
select * from user_errors;
SELECT TEXT FROM USER_SOURCE WHERE NAME='P2';
/
EXEC P2;
/
ALTER PROCEDURE P2 COMPILE;
/
CREATE OR REPLACE  PROCEDURE P_SELECT IS
V_EMPNO EMP.EMPNO%TYPE;
V_ENAME EMP.ENAME%TYPE;
V_SAL EMP.SAL%TYPE;

BEGIN
SELECT EMPNO,ENAME,SAL INTO 
V_EMPNO,V_ENAME,V_SAL
FROM EMP 
WHERE EMPNO=7934;

DBMS_OUTPUT.PUT_LINE('EMPNO:'||V_EMPNO);
DBMS_OUTPUT.PUT_LINE('ENAME:'||V_ENAME);
DBMS_OUTPUT.PUT_LINE('EMP_SAL:'||V_SAL);
END ;
/
EXEC P_SELECT;
/
CREATE OR REPLACE PROCEDURE P_INSERT IS
BEGIN
INSERT INTO DEPT(DEPTNO,DNAME,LOC)
VALUES(90,'D5','INDIA');
DBMS_OUTPUT.PUT_LINE('INSERTED');
END;
/

EXEC P_INSERT;
/
select * from dept where deptno=90;
/
CREATE OR REPLACE PROCEDURE P_UPDATE IS
BEGIN
UPDATE DEPT
SET LOC='S_INDIA'
WHERE DEPTNO=90;
DBMS_OUTPUT.PUT_LINE('UPDATED');
END ;

/
EXEC P_UPDATE;
/

CREATE OR REPLACE PROCEDURE P_DEPT IS
BEGIN
DELETE DEPT 
WHERE DEPTNO=10;
DBMS_OUTPUT.PUT_LINE('DELETED');
END;
/

EXEC P_DEPT;
/

CREATE OR REPLACE PROCEDURE P_MERGE IS
BEGIN
MERGE INTO DEPT1 A
USING DEPT B
ON (A.DEPTNO=B.DEPTNO)
WHEN MATCHED THEN
UPDATE 
SET LOC =B.LOC
WHEN NOT MATCHED THEN INSERT (DEPTNO,DNAME,LOC)
VALUES(B.DEPTNO,B.DNAME,B.LOC);
DBMS_OUTPUT.PUT_LINE('MERGES');
END;
/
EXEC P_MERGE;

CREATE OR REPLACE PROCEDURE P_COMMIT IS
BEGIN
INSERT INTO DEPT1 (DEPTNO,DNAME,LOC)
VALUES(50,'D6','INDIA');
DBMS_OUTPUT.PUT_LINE('INSERTED');
END;
/
EXEC P_COMMIT;
/

CREATE OR REPLACE FUNCTION F1 RETURN NUMBER IS
BEGIN
RETURN 125;
END;
/
VAR V NUMBER;
/

EXEC :V:=F1;
/
PRINT V;
/
CREATE OR REPLACE FUNCTION F1_IN(V1 IN NUMBER) RETURN
NUMBER IS
BEGIN
RETURN V1;
END;
/

EXEC :V:=F1_IN(6);
/
PRINT V;
/
SELECT F1_IN(25) FROM DUAL;
/
CREATE OR REPLACE FUNCTION F2_IN(V1 NUMBER,V2 NUMBER) RETURN NUMBER IS
BEGIN
RETURN V1*V2;
END;
/
EXEC :V:=F2_IN(5,2);
/
PRINT V;
/
SELECT F2_IN(V1=>1,V2=>4) FROM DUAL;
/
SELECT F2_IN(4,V2=>5) FROM DUAL;
/
SELECT F2_IN(V1=>4,5) FROM DUAL; -- THROWS ERROR 













SET SERVEROUTPUT ON;



























































