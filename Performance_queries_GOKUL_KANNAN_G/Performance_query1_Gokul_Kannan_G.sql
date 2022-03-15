--SQL QUERIES
--Find the total candidates who participated in the election in each state in the year 2004
select count(CAND_NAME) as Total_Candidates, ST_NAME FROM ELECTION WHERE YEAR = 2004 GROUP BY ST_NAME;

--Find the total female candidates participating each year?
SELECT COUNT(CAND_SEX) as Female_Candidates, YEAR FROM ELECTION WHERE CAND_SEX = 'F' GROUP BY YEAR order by year asc;

--find the total candidates who participated in West Bengal state in the year 2014?
SELECT COUNT(CAND_NAME) as Total_Candidates FROM ELECTION WHERE ST_NAME = 'West Bengal' AND YEAR = 2014;

--4. Find the total candidates who participated in the election at each state in each year
SELECT COUNT(CAND_NAME) , ST_NAME , YEAR  FROM ELECTION group by ST_NAME , YEAR ORDER BY ST_NAME , YEAR;

--5. What are the top 5 parties that got the most votes in Uttar Pradesh in the year 2014
SELECT PARTYNAME FROM ELECTION WHERE ST_NAME = 'Uttar Pradesh' and YEAR = 2014 group by partyname order by SUM(TOTVOTPOLL) DESC FETCH FIRST 5 ROWS ONLY;

--6.Find total votes BJP got In each state in the year 1987
SELECT ST_NAME , SUM(TOTVOTPOLL) AS VOTES FROM ELECTION WHERE YEAR = 1989 AND PARTYABBRE ='BJP' GROUP BY ST_NAME ORDER BY SUM(TOTVOTPOLL);

--7.Find the Total votes BJP Got in state 'andhra pradesh' in the year 1987?
SELECT SUM(TOTVOTPOLL) FROM ELECTION WHERE ST_NAME = 'Andhra Pradesh' and year = 1987;

--8. Find the Total vote percentage of BJP get in goa state in the year 2003
--IN 2004 ONLY BJP PARTICIPATED IN ELECTION
SELECT ROUND(SUM((TOTVOTPOLL))/SUM((ELECTORS)) * 100,2) AS TOTAL_VOTES FROM ELECTION WHERE ST_NAME = 'Goa' and Year = 2004 and PARTYABBRE = 'BJP';
  
--9. How many times has BJP gotten an Above 50% vote?
SELECT count(PARTYABBRE) AS COUNT FROM ELECTION 
WHERE PARTYABBRE = 'BJP' and (TOTVOTPOLL)/(ELECTORS) * 100 > 50;


--10. what is the state list the BJP gets below 75% vote? 
SELECT ST_NAME  FROM ELECTION WHERE PARTYABBRE = 'BJP' AND (TOTVOTPOLL)/(ELECTORS) * 100 < 75 GROUP BY ST_NAME;  