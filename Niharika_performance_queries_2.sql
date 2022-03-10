--performace queries set 2


--create index index_name on election(st_name,year,partyabbre,cand_name);

--1. Display the BJP candidate list participated at state Andaman & Nicobar Islands in the year 1984?
set serveroutput on;
CREATE OR REPLACE PROCEDURE CAND_LIST
IS
  CANDIDATE VARCHAR(30);
BEGIN 
    SELECT  CAND_NAME  INTO  CANDIDATE FROM   ELECTION  WHERE  PARTYABBRE = 'BJP'  AND   ST_NAME = 'Andaman & Nicobar Islands' AND  YEAR = 2014;
    DBMS_OUTPUT.PUT_LINE(CANDIDATE);
END;
/

--run the query
set serveroutput on
begin
CAND_LIST();
end;
/

/*
-- to find the time complexity

declare
t1 timestamp;
t2 timestamp;
begin
t1:=systimestamp;
dbms_output.put_line('start'||t1);
CAND_LIST;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line('seconds'||to_char(t2-t1,'SSSS.FF'));
END;

--time complexity:seconds+000000 00:00:00.000215000 */



--2 How many Male Candidates participated in elections in each state?
set serveroutput on;
CREATE OR REPLACE PROCEDURE MALE_CANDIDATES
IS
BEGIN 
 for j in (select count(cand_sex) a,st_name as b from election where cand_sex='M' group by st_name)
 loop
    DBMS_OUTPUT.PUT_LINE(j.a||'  '||j.b);
end loop;
END;
/

--run the query
set serveroutput on
begin
MALE_CANDIDATES;
end;
/

/*
---- to find the time complexity
declare
t1 timestamp;
t2 timestamp;
begin
t1:=systimestamp;
dbms_output.put_line('start'||t1);
MALE_CANDIDATES;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line('seconds'||to_char(t2-t1,'SSSS.FF'));
END;
--seconds+000000 00:00:00.010358000 */

--3. Display the Party name in descending order?

set serveroutput on;
CREATE OR REPLACE PROCEDURE PARTY_DESC_ORDER
IS
BEGIN 
 for j in (select partyname from election GROUP by partyname order by partyname desc)
 loop
    DBMS_OUTPUT.PUT_LINE(j.partyname);
end loop;
END;
/

--run the query
set serveroutput on
begin
PARTY_DESC_ORDER;
end;
/

/*
---- to find the time complexity
declare
t1 timestamp;
t2 timestamp;
begin
t1:=systimestamp;
dbms_output.put_line('start'||t1);
PARTY_DESC_ORDER;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line('seconds'||to_char(t2-t1,'SSSS.FF'));
END;
--second:+000000 00:00:00.002384900 */


--4. Find how many Candidates participated in the year West Bengal 1988?


set serveroutput on;
CREATE OR REPLACE PROCEDURE CANDIDATE_WESTBENGAL 
IS
CANDIDATE varchar(10);
BEGIN 
 select count(cand_name)  INTO CANDIDATE from election where  year=1998 and st_name='West Bengal'  group by st_name;
    dbms_output.put_line(CANDIDATE);
END;
/

--run the query
set serveroutput on
begin
CANDIDATE_WESTBENGAL;
end;
/

/*
------ to find the time complexity
declare
t1 timestamp;
t2 timestamp;
begin
t1:=systimestamp;
dbms_output.put_line('start'||t1);
CANDIDATE_WESTBENGAL;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line('seconds'||to_char(t2-t1,'SSSS.FF'));
END;
--seconds+000000 00:00:00.000310000 */

--5. Display the Tamilnadu Candidate list each year?

set serveroutput on;
CREATE OR REPLACE PROCEDURE TN_CANDIDATE
IS
BEGIN 
    for i in (select cand_name from election where st_name='Tamil Nadu')
    loop
    dbms_output.put_line(i.cand_name);
    end loop;
END;
/

--run the query
begin
TN_CANDIDATE;
end;
/

/*

------ to find the time complexity

declare
t1 timestamp;
t2 timestamp;
begin
t1:=systimestamp;
dbms_output.put_line('start'||t1);
TN_CANDIDATE;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line('seconds'||to_char(t2-t1,'SSSS.FF'));
END;
--seconds+000000 00:00:00.000210000 */