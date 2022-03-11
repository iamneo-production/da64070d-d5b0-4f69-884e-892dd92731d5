--Performance Queries set 1


--1. Find the total candidates who participated in the election in each state in the year 2004?

SELECT ST_NAME AS STATE, COUNT(CAND_NAME) AS CANDIDATE_COUNT  FROM ELECTION WHERE YEAR = 2004 GROUP BY ST_NAME;

--2. Find the total female candidates participating each year?

SELECT YEAR,COUNT(CAND_NAME) AS FEMALE_CANDIDATE_COUNT FROM ELECTION WHERE CAND_SEX = 'F' GROUP BY YEAR;

--3. find the total candidates who participated in West Bengal state in the year 2014?

SELECT COUNT(CAND_NAME) AS CANDIDATE_COUNT FROM ELECTION WHERE ST_NAME = 'West Bengal' AND YEAR =2014;

--4. Find the total candidates who participated in the election at each state in each year?

SELECT COUNT(CAND_NAME) AS CANDIDATE_COUNT , ST_NAME , YEAR  FROM ELECTION group by ST_NAME , YEAR;

--5. What are the top 5 parties that got the most votes in Uttar Pradesh in the year 2014?

SELECT PARTYNAME AS PARTY FROM ELECTION WHERE ST_NAME = 'Uttar Pradesh' and YEAR = 2014 group by partyname order by SUM(TOTVOTPOLL) DESC FETCH FIRST 5 ROWS ONLY;

--6. Find total votes BJP got In each state in the year 1987?

SELECT SUM(TOTVOTPOLL) AS VOTE_COUNT,ST_NAME FROM ELECTION WHERE YEAR=1987 AND PARTYABBRE='BJP' GROUP BY ST_NAME; 

--7. Find the Total votes BJP Got in state 'andhra pradesh' in the year 1987?

SELECT SUM(TOTVOTPOLL) AS VOTE_COUNT FROM ELECTION WHERE ST_NAME='Andhra Pradesh' AND YEAR=1987 AND PARTYABBRE='BJP';

--8. Find the Total vote percentage of BJP get in goa state in the year 2003?

SELECT ROUND(SUM(TOTVOTPOLL)*100.0/SUM(ELECTORS),2) AS VOTE_PERCENTAGE FROM ELECTION WHERE ST_NAME='Goa' AND YEAR=2003 AND PARTYABBRE='BJP' ;


--9. How many times has BJP gotten an Above 50% vote?

SELECT count(*) FROM ELECTION WHERE PARTYABBRE = 'BJP' and (TOTVOTPOLL)/(ELECTORS) * 100 > 50;
 

--10. what is the state list the BJP gets below 75% vote?

SELECT ST_NAME AS STATE_NAME  FROM ELECTION WHERE PARTYABBRE = 'BJP' AND (TOTVOTPOLL)/(ELECTORS) * 100 < 75 GROUP BY ST_NAME; 