--voting_pl-sql
create index election_index on election(st_name,year,cand_name,cand_name,cand_sex,partyname,partyabbre,totvotpoll,electors)

--1. Find the total candidates who participated in the election in each state in the year 2004?
set serveroutput on;
CREATE OR REPLACE PROCEDURE TOTAL_CAND_YEAR
IS
BEGIN 
    for i in(select count(Cand_name) as total_cand,st_name as state_name from election where year=2004 group by st_name)
    loop
    dbms_output.put_line(i.total_cand|| i.state_name);
    end loop;
END;
/


--run the procedure  
begin
TOTAL_CAND_YEAR;
end;
/

/*
------  time complexity

declare
t1 timestamp;
t2 timestamp;
begin
t1:=systimestamp;
dbms_output.put_line('start'||t1);
TOTAL_CAND_YEAR;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line('fractional seconds'||to_char(t2-t1,'SSSS.FF'));
END;

--fractional seconds+000000 00:00:00.001478000
*/

--2. Find the total female candidates participating each year?


set serveroutput on;
CREATE OR REPLACE PROCEDURE TOTAL_FEMALE_YEAR
IS
BEGIN 
    for i in(select count(cand_sex) as tot_female,year from election where cand_sex='F' group by year)
    loop
    dbms_output.put_line(i.tot_female||'         '|| i.year);
    end loop;
END;
/

--run the procedure 
begin
TOTAL_FEMALE_YEAR;
end;
/
/*
------  time complexity

declare
t1 timestamp;
t2 timestamp;
begin
t1:=systimestamp;
dbms_output.put_line('start'||t1);
TOTAL_FEMALE_YEAR;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line('fractional seconds'||to_char(t2-t1,'SSSS.FF'));
END;

--fractional seconds+000000 00:00:00.007186000
*/


--3. find the total candidates who participated in West Bengal state in the year 2014?	


set serveroutput on
CREATE OR REPLACE PROCEDURE TOTAL_CAND_WB_2014
IS
BEGIN 
    for i in(select count(cand_name) as tot_cand from election where year=2014 and st_name='West Bengal')
    loop
    dbms_output.put_line(i.tot_cand);
    end loop;
END;
/
--run the procedure query
begin
TOTAL_CAND_WB_2014;
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
TOTAL_CAND_WB_2014;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line('fractional seconds'||to_char(t2-t1,'SSSS.FF'));
END;

--fractional seconds+000000 00:00:00.000310000
*/


--4. Find the total candidates who participated in the election at each state in each year?


set serveroutput on
CREATE OR REPLACE PROCEDURE TOTAL_CAND_PART_YEAR
IS
BEGIN 
    for i in(select count(Cand_name) as total_cand,st_name,year from election group by st_name,year)
    loop
    dbms_output.put_line(i.total_cand ||' '||i.st_name||' '||i.year);
    end loop;
END;
/

--run the procedure 
begin
TOTAL_CAND_PART_YEAR;
end;
/

/*
------  time complexity

declare
t1 timestamp;
t2 timestamp;
begin
t1:=systimestamp;
dbms_output.put_line('start'||t1);
TOTAL_CAND_PART_YEAR;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line('fractional seconds'||to_char(t2-t1,'SSSS.FF'));
END;

--fractional seconds+000000 00:00:00.009413000
*/

----5. What are the top 5 parties that got the most votes in Uttar Pradesh in the year 2014?

set serveroutput on
CREATE OR REPLACE PROCEDURE TOP_FIVE_PARTY
IS
BEGIN 
    for i in(select * from (select partyname as v,sum(totvotpoll) as u from election where year=2014 and st_name='Uttar Pradesh'  group by partyname order by sum(totvotpoll) desc) where rownum<=5)
    loop
    dbms_output.put_line(i.v||' '||i.u);
    end loop;
END;
/

--run the procedure query
begin
TOP_FIVE_PARTY;
end;
/

/*
------  time complexity
declare
t1 timestamp;
t2 timestamp;
begin
t1:=systimestamp;
dbms_output.put_line('start'||t1);
TOP_FIVE_PARTY;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line('fractional seconds'||to_char(t2-t1,'SSSS.FF'));
END;

--fractional seconds+000000 00:00:00.004779000
*/

--6. Find total votes BJP got In each state in the year 1987

set serveroutput on
CREATE OR REPLACE PROCEDURE TOTAL_BJP_STATE_YEAR
IS
BEGIN 
    for i in (select sum(totvotpoll) as x,partyname ,st_name  from election where partyname='BJP'and  year=1987 group by partyname,st_name)
    loop
    dbms_output.put_line(i.x||' '||i.partyname||' '||i.st_name);
    end loop;
END;
/
--run the procedure
begin
TOTAL_BJP_STATE_YEAR;
end;
/
/*
------  time complexity
declare
t1 timestamp;
t2 timestamp;
begin
t1:=systimestamp;
dbms_output.put_line('start'||t1);
TOTAL_BJP_STATE_YEAR;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line('fractional seconds'||to_char(t2-t1,'SSSS.FF'));
END;

--fractional seconds+000000 00:00:00.004920000
*/

--7 Find the Total votes BJP Got in state 'andhra pradesh' in the year 1987?

set serveroutput on
CREATE OR REPLACE PROCEDURE TOTAL_VOTE_ANDHRA
IS
BEGIN 
    for i in (select sum(totvotpoll) as x,partyname,st_name from election where partyname='BJP'and  year=1987 and st_name='Andhra Pradesh' group by partyname,st_name)
    loop
    dbms_output.put_line(i.x||' '||i.partyname||' '||i.st_name);
    end loop;
END;
/
--run the procedure 
begin
TOTAL_VOTE_ANDHRA;
end;
/

/*
------  time complexity
declare
t1 timestamp;
t2 timestamp;
begin
t1:=systimestamp;
dbms_output.put_line('start'||t1);
TOTAL_VOTE_ANDHRA;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line('fractional seconds'||to_char(t2-t1,'SSSS.FF'));
END;
--fractional seconds+000000 00:00:00.000233000
*/

--8. Find the Total vote percentage of BJP get in goa state in the year 2003?

set serveroutput on
CREATE OR REPLACE PROCEDURE TOTAL_VOTE_BJP_GOA
IS
BEGIN 
    for i in (select  round(sum(totvotpoll)/(select sum(distinct electors)  from election where st_name='Goa' and year=2003) *100,2) as x,year from election where st_name='Goa' and partyname='BJP'and year=2003 group by partyname,year)
    loop
    dbms_output.put_line(i.x);
    end loop;
END;
/



--run the procedure 
begin
TOTAL_VOTE_BJP_GOA;
end;
/

/*
------  time complexity

declare
t1 timestamp;
t2 timestamp;
begin
t1:=systimestamp;
dbms_output.put_line('start'||t1);
TOTAL_VOTE_BJP_GOA;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line('fractional seconds'||to_char(t2-t1,'SSSS.FF'));
END;

--fractional seconds+000000 00:00:00.000336000
*/

--9 How many times has BJP gotten an Above 50% vote
set serveroutput on;

CREATE OR REPLACE PROCEDURE COUNT_BJP_ABOVE_FIFTY
IS
count1 number(10):=0;
BEGIN
for i in (select sum(electors) as x ,year from election  group by year,st_name) 
LOOP
for j in (select sum(totvotpoll) as v ,year from election where partyname='BJP' group by partyname,year)
LOOP
IF i.year=j.year then
if round((j.v/i.x)*100,0)>=50 then 
count1:=count1+1;
END IF;
end if;
END LOOP;
END LOOP;
DBMS_OUTPUT.PUT_LINE(count1);
end;
/

--run the procedure 
begin
COUNT_BJP_ABOVE_FIFTY;
end;
/

/*
------  time complexity
declare
t1 timestamp;
t2 timestamp;
begin
t1:=systimestamp;
dbms_output.put_line('start'||t1);
COUNT_BJP_ABOVE_FIFTY;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line(' fractional seconds'||to_char(t2-t1,'SSSS.FF'));
END;

--fractional seconds+000000 00:00:00.970408000

*/

---- 10.what is the state list the BJP gets below 75% vote

set serveroutput on;
CREATE OR REPLACE PROCEDURE BJP_STATE_ABOVE_75
IS
BEGIN
for i in (select sum( electors) as x ,st_name from election  group by st_name)
LOOP
for j in (select sum(totvotpoll) as v ,st_name from election where partyname='BJP' group by partyname,st_name)
LOOP
if i.st_name=j.st_name then
if round((j.v/i.x)*100,0)<75 then 
DBMS_OUTPUT.PUT_LINE(i.st_name);
END IF;
END IF;
END LOOP;
END LOOP;
end;
/

--run the procedure 
begin
BJP_STATE_ABOVE_75;
end;
/

/*
------   time complexity 
declare
t1 timestamp;
t2 timestamp;
begin
t1:=systimestamp;
dbms_output.put_line('start'||t1);
BJP_STATE_ABOVE_75;
t2:=systimestamp;
dbms_output.put_line('end'||t2);
dbms_output.put_line('fractional seconds'||to_char(t2-t1,'SSSS.FF'));
END;
--fractional seconds+000000 00:00:00.139969000


*/


























