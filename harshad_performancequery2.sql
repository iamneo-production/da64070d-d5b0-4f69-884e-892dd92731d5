--performancequery set 2

--1. Write a SQL query to calculate total votes Got BJP in Bihar State in 1996?
set serveroutput on;
CREATE OR REPLACE PROCEDURE TOTAL_VOTE_BJP_BIHAR
IS
BEGIN 
    for i in (select sum(totvotpoll) as x from election where st_name='Bihar' and year=1996 and partyname='BJP')
    loop
    dbms_output.put_line(i.x);
    end loop;
END;
/

--run the procedure
begin
TOTAL_VOTE_BJP_BIHAR;
end;
/

/*
------ time complexity

declare
t1 timestamp;
t2 timestamp;
begin
t1:=systimestamp;
dbms_output.put_line('start'||t1);
TOTAL_VOTE_BJP_BIHAR;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line('fractional seconds'||to_char(t2-t1,'SSSS.FF'));
END;

--fractional seconds+000000 00:00:00.002314000
*/

----2. Write a SQL query to display the BJP Candidates list in descending order?
set serveroutput on;
CREATE OR REPLACE PROCEDURE BJP_CAND_DESC
IS
BEGIN 
    for i in (select cand_name from election where partyname='BJP' order by cand_name desc)
    loop
    dbms_output.put_line(i.cand_name);
    end loop;
END;
/
--run the procedure
begin
BJP_CAND_DESC;
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
BJP_CAND_DESC;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line('fractional seconds'||to_char(t2-t1,'SSSS.FF'));
END;

--fractional seconds+000000 00:00:00.001596500
*/


--3. Find how many times congress gets above 50% vote in Bihar state?

set serveroutput on
CREATE OR REPLACE PROCEDURE COUNT_CONGRESS_BIHAR
IS
count1 number(10):=0;
BEGIN
for i in (select sum(electors) as x,year  from election where st_name='Bihar' group by year)
LOOP
for j in (select sum(totvotpoll) as v ,year from election where st_name='Bihar' and partyname='Indian National Congress' group by year)
LOOP
if i.year=j.year then
if round((j.v/i.x)*100,0)>50 then 
count1:=count1+1;
END IF;
END IF;
END LOOP;
END LOOP;
DBMS_OUTPUT.PUT_LINE(count1);
end;
/


--run the procedure
begin
COUNT_CONGRESS_BIHAR;
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
COUNT_CONGRESS_BIHAR;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line('fractional seconds'||to_char(t2-t1,'SSSS.FF'));
END;
-- fractional seconds+000000 00:00:00.022432000
*/


--4. Find the Sikkim Candidate list each year
set serveroutput on;
CREATE OR REPLACE PROCEDURE SIKKIM_CAND
IS
BEGIN 
    for i in (select cand_name AS X,year from election where st_name='Sikkim')
    loop
    dbms_output.put_line( i.x || i.year);
    end loop;
END;
/

--run the procedure

begin
SIKKIM_CAND;
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
COUNT_CONGRESS_BIHAR;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line('fractional seconds'||to_char(t2-t1,'SSSS.FF'));
END;
--fractional seconds+000000 00:00:00.021476000
*/

--5. Find total male candidates who participated in the election
set serveroutput on;
CREATE OR REPLACE PROCEDURE TOTAL_MALE_CAND_ELECTION
IS
BEGIN 
    for i in (select count(cand_sex) as x from election where cand_sex='M')
    loop
    dbms_output.put_line(i.x);
    end loop;
END;
/

--run the procedure
begin
TOTAL_MALE_CAND_ELECTION;
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
TOTAL_MALE_CAND_ELECTION;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line('fractional seconds'||to_char(t2-t1,'SSSS.FF'));
END;

--fractional seconds+000000 00:00:00.006700000
*/








