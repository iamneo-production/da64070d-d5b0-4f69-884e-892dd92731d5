-- performance sql queries
--set 1
--1. Find the total candidates who participated in the election in each state in the year 2004?
	select count(Cand_name) as total_candidate_participated,st_name as state_name from election where year=2004 group by st_name;

--2. Find the total female candidates participating each year?
	select count(cand_sex) as total_female_candidate_participated,year from election where cand_sex='F' group by year;

--3. find the total candidates who participated in West Bengal state in the year 2014?			
	select count(cand_name) as total_candidate_participated_wb from election where year=2014 and st_name='West Bengal';

--4. Find the total candidates who participated in the election at each state in each year?
	select count(Cand_name) as total_candidate_participated,st_name,year from election group by st_name,year;

--5. What are the top 5 parties that got the most votes in Uttar Pradesh in the year 2014?
	select * from (select partyname,sum(totvotpoll) from election where year=2014 and st_name='Uttar Pradesh'  group by partyname order by sum(totvotpoll) desc) where rownum<=5;

--6. Find total votes BJP got In each state in the year 1987
	select sum(totvotpoll) as total_vote_bjp,partyname,st_name from election where partyname='BJP'and  year=1987 group by partyname,st_name;


--7. Find the Total votes BJP Got in state 'andhra pradesh' in the year 1987?	
	select sum(totvotpoll) as total_vote_bjp ,partyname,st_name from election where partyname='BJP'and  year=1987 and st_name='Andhra Pradesh' group by partyname,st_name;

--8. Find the Total vote percentage of BJP get in goa state in the year 2003?
	select  round(sum(totvotpoll)/(select sum(distinct electors) as total_vote_percentage from election where st_name='Goa' and year=2003) *100,2),year from election where st_name='Goa' and partyname='BJP'and year=2004 group by partyname,year;

--9 How many times has BJP gotten an Above 50% vote?

set serveroutput on;
DECLARE
count1 number(10):=0;
BEGIN
for i in (select sum( distinct electors) as x ,year from election  group by year,st_name) 

LOOP
for j in (select sum(totvotpoll) as v ,year from election where partyname='BJP' group by partyname,year)
LOOP
if i.year=j.year then
if round((j.v/i.x)*100,0)>=50 then 
count1:=count1+1;
END IF;
END IF;
END LOOP;
END LOOP;
DBMS_OUTPUT.PUT_LINE(count1);
end;
/

---- 10.what is the state list the BJP gets below 75% vote
set serveroutput on;
DECLARE
BEGIN
for i in (select sum(electors) as x ,st_name from election  group by st_name)
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


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--set-2

--1. Display the BJP candidate list participated at state Andaman & Nicobar Islands in the year 1984?
   	select cand_name from election where st_name='Andaman & Nicobar Islands'and partyAbbre='BJP' and year=1984;
--2. How many Male Candidates participated in elections in each state?
	select count(cand_sex) as total_male_cand,st_name from election where cand_sex='M' group by st_name;
--3. Display the Party name in descending order
	select partyname from election group by partyname order by partyname desc;
--4. Find how many Candidates participated in the year West Bengal 1988?
	select count(cand_name) as total_cand from election where st_name='West Bengal' and year=1998 group by st_name;
--5. Display the Tamilnadu Candidate list each year?
	select cand_name from election where st_name='Tamilnadu';
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--set3

--1. Write a SQL query to calculate total votes Got BJP in Bihar State in 1996?

	select sum(totvotpoll) as total_vote_bjp from election where st_name='Bihar' and year=1996 and partyname='BJP';
--2. Write a SQL query to display the BJP Candidates list in descending order?
select cand_name from election where partyname='BJP' order by cand_name desc;
--3. Find how many times congress gets above 50% vote in Bihar state?
set serveroutput on
DECLARE
count1 number(10):=0;
BEGIN
for i in (select sum(electors) as x,year  from election where st_name='Bihar' group by year)
LOOP
for j in (select sum(totvotpoll) as v ,year from election where st_name='Bihar' and partyname='Indian National Congress' group by year)
LOOP
if i.year=j.year then
if round((j.v/i.x)*100,0)>50 then 
--dbms_output.put_line((j.v/i.x)*100);
count1:=count1+1;
END IF;
END IF;
END LOOP;
END LOOP;
DBMS_OUTPUT.PUT_LINE(count1);
end;
/
--4. Find the Sikkim Candidate list each year
	select cand_name from election where st_name='Sikkim';
--5. Find total male candidates who participated in the election
	select count(cand_sex) as total_male_cand from election where cand_sex='M';
    