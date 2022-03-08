--perfomance Queries set 3
-- 1.Write a SQL query to calculate total votes Got BJP in Bihar State in 1996?

SELECT SUM(TOTVOTPOLL) FROM ELECTION
WHERE ST_NAME = 'Bihar' AND YEAR = 1996;

-- 2.Write a SQL query to display the BJP Candidates list in descending order?

 SELECT DISTINCT(CAND_NAME) FROM ELECTION 
 WHERE PARTYABBRE = 'BJP'
 ORDER BY CAND_NAME DESC;


-- 3. Find how many times congress gets above 50% vote in Bihar state?
 
 SELECT PC_NAME,COUNT(TOTVOTPOLL) FROM ELECTION WHERE ST_NAME = 'Bihar'
 AND PARTYABBRE = 'IND' GROUP BY PC_NAME HAVING ROUND(SUM(TOTVOTPOLL)/SUM(ELECTORS)*100,0) > 10;

 
--4. Find the Sikkim Candidate list each year?

  SELECT YEAR,CAND_NAME FROM ELECTION 
  WHERE ST_NAME = 'Sikkim'
  ORDER BY YEAR;

--5. Find total male candidates who participated in the election?

 SELECT COUNT(CAND_NAME) FROM ELECTION 
 WHERE CAND_SEX = 'M';