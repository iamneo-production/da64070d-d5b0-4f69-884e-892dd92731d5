-============> prerformance query set 1

SELECT * FROM ELECTION WHERE PARTYABBRE ='BJP'; 

--1. Find the total candidates who participated in the election in each state in the year 2004?


  SELECT COUNT(CAND_NAME) 
  FROM ELECTION 
  WHERE YEAR = 2004;

  --2.Find the total female candidates participating each year?

  SELECT COUNT (CAND_SEX) "Female Candidates", YEAR
  FROM ELECTION 
  WHERE CAND_SEX = 'F' 
  GROUP BY YEAR;

  --3.find the total candidates who participated in West Bengal state in the year 2014?

  SELECT COUNT (CAND_NAME) "Bengal Candidates of 2014"
  FROM ELECTION
  WHERE ST_NAME = 'West Bengal' 
  AND YEAR = 2014;

  --4.Find the total candidates who participated in the election at each state in each year?
   SELECT COUNT(CAND_NAME) "Candidates",
   ST_NAME "State" , YEAR "Year"
   FROM ELECTION 
   GROUP BY YEAR,ST_NAME ;

   --5.What are the top 5 parties that got the most votes in Uttar Pradesh in the year 2014?

    SELECT PARTYABBRE 
    FROM ELECTION 
    WHERE ST_NAME = 'Uttar Pradesh' 
    AND YEAR = 2014
    ORDER BY TOTVOTPOLL DESC FETCH FIRST 5 ROWS ONLY;

 --6. Find total votes BJP got In each state in the year 1987?

    SELECT ST_NAME "STATE",SUM(TOTVOTPOLL) "VOTES" 
    FROM ELECTION 
    WHERE PARTYABBRE = 'BJP' AND YEAR = 1989
    GROUP BY ST_NAME;


--> reference query
  SELECT CAND_NAME FROM ELECTION WHERE YEAR = 1989;

  --7. Find the Total votes BJP Got in state 'andhra pradesh' in the year 1987?
   

   SELECT SUM(TOTVOTPOLL) "VOTES" 
   FROM ELECTION 
   WHERE ST_NAME = 'Andhra Pradesh' AND YEAR = 1989;

   --8.Find the Total vote percentage of BJP get in goa state in the year 2003?
    
    SELECT ROUND(SUM(TOTVOTPOLL)/SUM(ELECTORS)*100,2) "Percentage"
    FROM ELECTION WHERE PARTYABBRE = 'BJP' 
    AND ST_NAME = 'Goa' AND YEAR = 2009 ;
    
    --9.How many times has BJP gotten an Above 50% vote?

       SELECT PC_NAME,COUNT(PC_NAME) FROM ELECTION WHERE PARTYABBRE = 'BJP'
       GROUP BY PC_NAME HAVING ROUND(SUM(TOTVOTPOLL)/SUM(ELECTORS)*100,0) > 40;


       SELECT PC_NAME,YEAR  FROM ELECTION WHERE PARTYABBRE = 'BJP'GROUP BY YEAR HAVING ROUND(TOTVOTPOLL/ELECTORS * 100,0)>10;
       
       SELECT ST_NAME,COUNT(ST_NAME) FROM ELECTION WHERE PARTYABBRE = 'BJP'
       GROUP BY ST_NAME HAVING ROUND(SUM(TOTVOTPOLL)/SUM(ELECTORS)*100,0) > 10;



       SELECT YEAR,ROUND(SUM(TOTVOTPOLL)/SUM(ELECTORS)*100,2) "Percentage" FROM ELECTION
       WHERE PARTYABBRE = 'BJP' GROUP BY YEAR;

       SELECT *  FROM ELECTION WHERE YEAR = 1999 AND PARTYABBRE = 'BJP';


       --10. what is the state list the BJP gets below 75% vote?

       SELECT ST_NAME FROM ELECTION WHERE PARTYABBRE = 'BJP'
       GROUP BY ST_NAME HAVING  ROUND(SUM(TOTVOTPOLL)/SUM(ELECTORS)*100,0) < 75;