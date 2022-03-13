--OWN PROCEDURES
--UPDATING VOTES WITH PATYBNAME
CREATE OR REPLACE PROCEDURE UPDATE_VOTES
IS
BEGIN
update election set TOTVOTPOLL = TOTVOTPOLL+1 where PC_NAME = 'Kurnool' and PARTYABBRE ='INC' AND YEAR = 1989;
DBMS_OUTPUT.PUT_LINE('UPDATED SUCESSFULLY');
END;
/

BEGIN
UPDATE_VOTES();
END;
/

--UPDATE VOTES WITH CANDIDIATE NAME
CREATE OR REPLACE PROCEDURE UPDATE_VOTES1
IS
BEGIN
update election set TOTVOTPOLL = TOTVOTPOLL+1
 where CAND_NAME = 'Kotla Vijay Bhaskara Reddy' and 
 PARTYABBRE ='INC' AND YEAR = 1989;
DBMS_OUTPUT.PUT_LINE('UPDATED SUCESSFULLY');
END;
/

BEGIN
UPDATE_VOTES1();
END;
/

SELECT * FROM ELECTION WHERE ST_NAME = 'Tamil Nadu';
--calculate total votes Got BJP in Bihar State in 1996?
CREATE OR REPLACE PROCEDURE SELECT98
IS
TOT_VOT NUMBER;
BEGIN
select sum(TOTVOTPOLL) INTO TOT_VOT FROM ELECTION 
WHERE PARTYABBRE = 'BJP' AND 
YEAR = 1996 AND ST_NAME = 'Bihar';
DBMS_OUTPUT.PUT_LINE(TOT_VOT);
END;
/

BEGIN
SELECT98();
END;
/


--display the BJP Candidates list in descending order?
CREATE OR REPLACE PROCEDURE CAND_NAME1
IS
TYPE NTYPE IS TABLE OF VARCHAR(100);
CANDN NTYPE;
BEGIN
SELECT DISTINCT(CAND_NAME) BULK COLLECT INTO CANDN
 FROM ELECTION
  WHERE PARTYABBRE = 'BJP'
   ORDER BY CAND_NAME DESC;
FOR I IN 1..CANDN.COUNT LOOP
DBMS_OUTPUT.PUT_LINE(CANDN(I));
END LOOP;
END;
/

BEGIN
CAND_NAME1();
END;
/

--Find how many times congress gets above 50% vote in Bihar state?
CREATE OR REPLACE PROCEDURE INC50
IS
COUNT1 NUMBER;
BEGIN
SELECT count(PARTYNAME) INTO COUNT1 FROM ELECTION 
WHERE ST_NAME = 'Bihar' AND 
PARTYABBRE = 'INC' and 
(TOTVOTPOLL)/(ELECTORS) * 100 > 20;
DBMS_OUTPUT.PUT_LINE(COUNT1);
END;
/

BEGIN
INC50();
END;
/

--Find the Sikkim Candidate list each year?
CREATE OR REPLACE PROCEDURE SIKKIMCAND
IS
TYPE NTYPE IS TABLE OF NUMBER;
TYPE CTYPE IS TABLE OF VARCHAR(30);
CANDC CTYPE;
YEARC NTYPE;
BEGIN
SELECT CAND_NAME, YEAR
 BULK COLLECT
  INTO CANDC, YEARC FROM ELECTION
   WHERE ST_NAME = 'Sikkim'
ORDER BY YEAR;
FOR I IN 1..CANDC.COUNT LOOP
DBMS_OUTPUT.PUT_LINE(CANDC(I)||'  '||YEARC(I));
END LOOP;
END;
/

BEGIN
SIKKIMCAND();
END;
/


--Find total male candidates who participated in the election?
CREATE OR REPLACE PROCEDURE MALECAND
IS
CANDC NUMBER;
BEGIN
SELECT COUNT(CAND_SEX) INTO CANDC
 FROM ELECTION 
 WHERE CAND_SEX = 'M';
 DBMS_OUTPUT.PUT_LINE(CANDC);
 END;
 /

 BEGIN
 MALECAND();
 END;
 /