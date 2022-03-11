
--Performance queries set-1

--1. Find the total candidates who participated in the election in each state in the year 2004?
set serveroutput on;
CREATE OR REPLACE PROCEDURE TOTAL_CANDIDATES
IS
BEGIN 
    for i in(select count(Cand_name) as CANDIDATE_COUNT,st_name as STATE from election where year=2004 group by st_name)
    loop
    dbms_output.put_line(i.candidate_count||' '||i.state);
    end loop;
END;
/

--run the query
begin
TOTAL_CANDIDATES;
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
TOTAL_CANDIDATES;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line('fractional seconds'||to_char(t2-t1,'SSSS.FF'));
END;
--fractional seconds+000000 00:00:00.001478000 */


--2. Find the total female candidates participating each year?


set serveroutput on;
CREATE OR REPLACE PROCEDURE FEMALE_CAND
IS
BEGIN 
    for i in(select count(cand_sex) as female_count,year from election where cand_sex='F' group by year)
    loop
    dbms_output.put_line(i.female_count||'         '|| i.year);
    end loop;
END;
/

--run the query
begin
FEMALE_CAND;
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
FEMALE_CAND;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line('fractional seconds'||to_char(t2-t1,'SSSS.FF'));
END;
--fractional seconds+000000 00:00:00.007186000 */



--3. find the total candidates who participated in West Bengal state in the year 2014?	


set serveroutput on
CREATE OR REPLACE PROCEDURE TOTAL_CAND_WESTBENGAL
IS
BEGIN 
    for i in(select count(cand_name) as cand_count from election where year=2014 and st_name='West Bengal')
    loop
    dbms_output.put_line(i.cand_count);
    end loop;
END;
/
--run the query
begin
TOTAL_CAND_WESTBENGAL;
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
TOTAL_CAND_WESTBENGAL;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line('fractional seconds'||to_char(t2-t1,'SSSS.FF'));
END;

--fractional seconds+000000 00:00:00.000310000 */



--4. Find the total candidates who participated in the election at each state in each year?


set serveroutput on
CREATE OR REPLACE PROCEDURE TOTAL_CAND_EACH_STATE
IS
BEGIN 
    for i in(select count(Cand_name) as cand_count,st_name as state,year from election group by st_name,year)
    loop
    dbms_output.put_line(i.cand_count ||'   '||i.state||'   '||i.year);
    end loop;
END;
/

--run the query
begin
TOTAL_CAND_EACH_STATE;
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
TOTAL_CAND_EACH_STATE;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line('fractional seconds'||to_char(t2-t1,'SSSS.FF'));
END;

--fractional seconds+000000 00:00:00.009413000 */


----5. What are the top 5 parties that got the most votes in Uttar Pradesh in the year 2014?

set serveroutput on
CREATE OR REPLACE PROCEDURE TOP_FIVE_PARTY_NAME
IS
BEGIN 
    for i in(select * from (select partyname as party,sum(totvotpoll) as total_votes from election where year=2014 and st_name='Uttar Pradesh'  group by partyname order by sum(totvotpoll) desc) where rownum<=5)
    loop
    dbms_output.put_line(i.party||' '||i.total_votes);
    end loop;
END;
/

--run the query
begin
TOP_FIVE_PARTY_NAME;
end;
/

/*
declare
t1 timestamp;
t2 timestamp;
begin
t1:=systimestamp;
dbms_output.put_line('start'||t1);
TOP_FIVE_PARTY_NAME;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line('fractional seconds'||to_char(t2-t1,'SSSS.FF'));
END;
--fractional seconds+000000 00:00:00.004779000  */


--6. Find total votes BJP got In each state in the year 1987

set serveroutput on
CREATE OR REPLACE PROCEDURE TOTAL_VOTES_BJP
IS
BEGIN 
    for i in (select sum(totvotpoll) as total_votes,partyname ,st_name  from election where partyname='BJP'and  year=1987 group by partyname,st_name)
    loop
    dbms_output.put_line(i.total_votes||' '||i.partyname||' '||i.st_name);
    end loop;
END;
/
--run the query
begin
TOTAL_VOTES_BJP;
end;
/

/*
declare
t1 timestamp;
t2 timestamp;
begin
t1:=systimestamp;
dbms_output.put_line('start'||t1);
TOTAL_VOTES_BJP;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line('fractional seconds'||to_char(t2-t1,'SSSS.FF'));
END;
--fractional seconds+000000 00:00:00.004920000 */

--7 Find the Total votes BJP Got in state 'andhra pradesh' in the year 1987?

set serveroutput on
CREATE OR REPLACE PROCEDURE BJP_VOTES_ANDHRA
IS
BEGIN 
    for i in (select sum(totvotpoll) as total_votes,partyname,st_name from election where partyname='BJP'and  year=1987 and st_name='Andhra Pradesh' group by partyname,st_name)
    loop
    dbms_output.put_line(i.total_votes||' '||i.partyname||' '||i.st_name);
    end loop;
END;
/
--run the query
begin
BJP_VOTES_ANDHRA;
end;
/


/*
declare
t1 timestamp;
t2 timestamp;
begin
t1:=systimestamp;
dbms_output.put_line('start'||t1);
BJP_VOTES_ANDHRA;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line('seconds'||to_char(t2-t1,'SSSS.FF'));
END;
--seconds+000000 00:00:00.000233000  */

--8. Find the Total vote percentage of BJP get in goa state in the year 2003?

set serveroutput on
CREATE OR REPLACE PROCEDURE VOTES_BJP_GOA
IS
BEGIN 
    for i in (select  round(sum(totvotpoll)/(select sum(distinct electors)  from election where st_name='Goa' and year=2003) *100,2) as x,year from election where st_name='Goa' and partyname='BJP'and year=2003 group by partyname,year)
    loop
    dbms_output.put_line(i.x);
    end loop;
END;
/



--run the query
begin
VOTES_BJP_GOA;
end;
/

/*
declare
t1 timestamp;
t2 timestamp;
begin
t1:=systimestamp;
dbms_output.put_line('start'||t1);
TOTAL_VOTE_BJP_GOA;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line('seconds'||to_char(t2-t1,'SSSS.FF'));
END;
--seconds+000000 00:00:00.000336000 */


--9. How many times has BJP gotten an Above 50% vote?

SELECT count(*) FROM ELECTION WHERE PARTYABBRE = 'BJP' and (TOTVOTPOLL)/(ELECTORS) * 100 > 50;
 

--10. what is the state list the BJP gets below 75% vote?

SELECT ST_NAME AS STATE_NAME  FROM ELECTION WHERE PARTYABBRE = 'BJP' AND (TOTVOTPOLL)/(ELECTORS) * 100 < 75 GROUP BY ST_NAME; 