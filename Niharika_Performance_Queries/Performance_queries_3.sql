--Performance Query set 3


--1. Write a SQL query to calculate total votes Got BJP in Bihar State in 1996?

select sum(TOTVOTPOLL) from election where PARTYABBRE='BJP' and year=1996 and st_name='Bihar' ;

--2. Write a SQL query to display the BJP Candidates list in descending order?

select  cand_name from election where PARTYABBRE='BJP' order by cand_name desc;


--3. Find how many times congress gets above 50% vote in Bihar state?


SELECT count(*) FROM ELECTION WHERE ST_NAME = 'Bihar' AND PARTYABBRE = 'INC' and (TOTVOTPOLL)/(ELECTORS) * 100 > 20;

--4. Find the Sikkim Candidate list each year?

select CAND_NAME,year from election where st_name='Sikkim';

--5. Find total male candidates who participated in the election?

select cand_name,cand_sex from election where cand_sex='M';