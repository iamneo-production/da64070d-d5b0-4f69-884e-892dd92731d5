
--performace procedure querys set 1




--1. Display the BJP candidate list participated at state Andaman & Nicobar Islands in the year 1984?
set serveroutput on;
CREATE OR REPLACE PROCEDURE BJP_CAND
IS
  a VARCHAR(30);
BEGIN 
    SELECT  CAND_NAME  INTO  a FROM   ELECTION  WHERE  PARTYABBRE = 'BJP'  AND   ST_NAME = 'Andaman & Nicobar Islands' AND  YEAR = 2014;
    DBMS_OUTPUT.PUT_LINE(a);
END;
/

--run the procedure
set serveroutput on
begin
BJP_CAND;
end;
/

--  time complexity
/*
declare
t1 timestamp;
t2 timestamp;
begin
t1:=systimestamp;
dbms_output.put_line('start'||t1);
BJP_CAND;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line('fractional seconds'||to_char(t2-t1,'SSSS.FF'));
END;

--fractional seconds+000000 00:00:00.000215000
*/



--2 How many Male Candidates participated in elections in each state?
set serveroutput on;
CREATE OR REPLACE PROCEDURE MALE_CAND_EACH_STATES
IS
BEGIN 
 for i in (select count(cand_sex) a,st_name as b from election where cand_sex='M' group by st_name)
 loop
    DBMS_OUTPUT.PUT_LINE(i.a||' '||i.b);
end loop;
END;
/

--run the procedure
set serveroutput on
begin
MALE_CAND_EACH_STATES;
end;
/

----  time complexity
/*
declare
t1 timestamp;
t2 timestamp;
begin
t1:=systimestamp;
dbms_output.put_line('start'||t1);
MALE_CAND_EACH_STATES;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line('fractional seconds'||to_char(t2-t1,'SSSS.FF'));
END;
--fractional seconds+000000 00:00:00.010358000
*/

--3. Display the Party name in descending order?

set serveroutput on;
CREATE OR REPLACE PROCEDURE PARTY_NAME_DESC
IS
BEGIN 
 for i in (select partyname from election GROUP by partyname order by partyname desc)
 loop
    DBMS_OUTPUT.PUT_LINE(i.partyname);
end loop;
END;
/

--run the procedure
set serveroutput on
begin
PARTY_NAME_DESC;
end;
/

----  time complexity
/*
declare
t1 timestamp;
t2 timestamp;
begin
t1:=systimestamp;
dbms_output.put_line('start'||t1);
PARTY_NAME_DESC;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line('fractional seconds'||to_char(t2-t1,'SSSS.FF'));
END;
--fractional second:+000000 00:00:00.002384900
*/

--4. Find how many Candidates participated in the year West Bengal 1988?


set serveroutput on;
CREATE OR REPLACE PROCEDURE CAND_PART_WESTBENGAL
IS
A varchar(10);
BEGIN 
 select count(cand_name) INTO A from election where st_name='West Bengal' and year=1998 group by st_name;
    dbms_output.put_line(A);
END;
/

--run the procedure
set serveroutput on
begin
CAND_PART_WESTBENGAL;
end;
/

------ time complexity
/*
declare
t1 timestamp;
t2 timestamp;
begin
t1:=systimestamp;
dbms_output.put_line('start'||t1);
CAND_PART_WESTBENGAL;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line('fractional seconds'||to_char(t2-t1,'SSSS.FF'));
END;

--fractional seconds+000000 00:00:00.000310000
*/

--5. Display the Tamilnadu Candidate list each year?

set serveroutput on;
CREATE OR REPLACE PROCEDURE CAND_NAME_TAMIL
IS
BEGIN 
    for i in (select cand_name from election where st_name='Tamilnadu')
    loop
    dbms_output.put_line(i.cand_name);
    end loop;
END;
/

--run the procedure
begin
CAND_NAME_TAMIL;
end;
/

------  time complexity
/*
declare
t1 timestamp;
t2 timestamp;
begin
t1:=systimestamp;
dbms_output.put_line('start'||t1);
CAND_NAME_TAMIL;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line('fractional seconds'||to_char(t2-t1,'SSSS.FF'));
END;
--fractional seconds+000000 00:00:00.000210000
*/






