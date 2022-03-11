--1. Write a SQL query to calculate total votes Got BJP in Bihar State in 1996?
select sum(TOTVOTPOLL) as TOTAL_VOTES FROM ELECTION WHERE PARTYABBRE = 'BJP' AND YEAR = 1996 AND ST_NAME = 'Bihar';

--2. Write a SQL query to display the BJP Candidates list in descending order?
SELECT DISTINCT(CAND_NAME) FROM ELECTION WHERE PARTYABBRE = 'BJP' ORDER BY CAND_NAME DESC;

--3. Find how many times congress gets above 50% vote in Bihar state?
SELECT count(*) FROM ELECTION WHERE ST_NAME = 'Bihar' AND PARTYABBRE = 'INC' and (TOTVOTPOLL)/(ELECTORS) * 100 > 20;

--4. Find the Sikkim Candidate list each year?
SELECT CAND_NAME AS CANDIDATE_NAME , YEAR FROM ELECTION WHERE ST_NAME = 'Sikkim' order by year ;

--5. Find total male candidates who participated in the election?
SELECT CAND_NAME AS MALE_CANIDIATE FROM ELECTION WHERE CAND_SEX = 'M';