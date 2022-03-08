--perfomance Queries set 2


-- 1. Display the BJP candidate list participated at state Andaman & Nicobar Islands in the year 1984?
  SELECT CAND_NAME 
  FROM ELECTION 
  WHERE PARTYABBRE = 'BJP' AND 
  ST_NAME = 'Andaman & Nicobar Islands' AND YEAR = 1991;
 
 --2.How many Male Candidates participated in elections in each state?

 SELECT ST_NAME,COUNT(CAND_NAME) FROM ELECTION 
 WHERE CAND_SEX = 'M' 
 GROUP BY ST_NAME;

--3. Display the Party name in descending order?

SELECT DISTINCT(PARTYNAME) FROM ELECTION 
ORDER BY PARTYNAME DESC;

 --4. Find how many Candidates participated in the year West Bengal 1988? 

 SELECT COUNT(CAND_NAME) FROM ELECTION
  WHERE ST_NAME = 'West Bengal' 
  AND YEAR = 2014;

  --5.  Display the Tamilnadu Candidate list each year?

  SELECT YEAR,CAND_NAME FROM ELECTION 
  WHERE ST_NAME = 'Tamil Nadu' 
  ORDER BY YEAR;



