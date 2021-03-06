-->perfomance Queries set 2

-->1. Display the BJP candidate list participated at state Andaman & Nicobar Islands in the year 1984?

---> Query
SELECT 
  CAND_NAME "Candidates"
FROM 
  ELECTION 
WHERE 
  PARTYABBRE = 'BJP' 
AND 
  ST_NAME = 'Andaman & Nicobar Islands' 
AND 
  YEAR = 2014;

--> Procedure

CREATE OR REPLACE PROCEDURE BJPCAND_ANI_1984
IS
  c_name VARCHAR(32);
BEGIN
  SELECT 
    CAND_NAME 
  INTO 
    c_name
  FROM 
    ELECTION 
  WHERE 
    PARTYABBRE = 'BJP' 
  AND 
    ST_NAME = 'Andaman & Nicobar Islands' 
  AND 
    YEAR = 2014;
  DBMS_OUTPUT.PUT_LINE('ANI Candidates are : '||c_name);
END;
/
----------------------------------------------------------------------------------------   

--2.How many Male Candidates participated in elections in each state?

--> Query
SELECT 
  ST_NAME "State" ,COUNT(CAND_NAME) "Candidates Count"
FROM 
  ELECTION 
WHERE 
  CAND_SEX = 'M' 
GROUP BY 
  ST_NAME;

--> Procedure

CREATE OR REPLACE PROCEDURE MALE_CAND_STATE
IS
   TYPE COUNT_TYPE IS TABLE OF NUMBER;
   TYPE NAME_TYPE IS TABLE OF VARCHAR(100);
   state NAME_TYPE;
   cand_count COUNT_TYPE;
BEGIN
  SELECT 
    ST_NAME,COUNT(CAND_NAME) BULK COLLECT INTO state,cand_count 
  FROM 
    ELECTION 
  WHERE 
    CAND_SEX = 'M' 
  GROUP BY 
    ST_NAME;
  FOR idx IN 1..state.COUNT
  LOOP
   DBMS_OUTPUT.PUT_LINE(state(idx)||'  '||cand_count(idx));
  END LOOP;
END;
/
-------------------------------------------------------------------------------------------

--3. Display the Party name in descending order?

-->Query
SELECT 
  DISTINCT (PARTYNAME) "Parties"
FROM 
  ELECTION 
ORDER BY 
  PARTYNAME DESC;

EXPLAIN PLAN FOR
  SELECT 
    DISTINCT (PARTYNAME) "Parties"
  FROM 
    ELECTION 
  ORDER BY 
    PARTYNAME DESC;

SELECT
    PLAN_TABLE_OUTPUT
FROM
    TABLE(DBMS_XPLAN.DISPLAY);
/*
	
	
PLAN_TABLE_OUTPUT
	
Plan hash value: 2465312145
	
	
-------------------------------------------------------------------------------
	
| Id | Operation | Name | Rows | Bytes | Cost (%CPU)| Time |
	
-------------------------------------------------------------------------------
	
| 0 | SELECT STATEMENT | | 1424 | 21360 | 619 (2)| 00:00:01 |
	
| 1 | SORT UNIQUE | | 1424 | 21360 | 616 (1)| 00:00:01 |
	
| 2 | TABLE ACCESS FULL| ELECTION | 73081 | 1070K| 239 (1)| 00:00:01 |
	
-------------------------------------------------------------------------------
*/
--> Procedure

CREATE OR REPLACE PROCEDURE PARTIES
IS
  TYPE NAME_TYPE IS TABLE OF VARCHAR(100);
  party NAME_TYPE;
BEGIN
  SELECT 
    DISTINCT(PARTYNAME) 
  BULK 
    COLLECT 
  INTO 
    party
  FROM 
    ELECTION 
  ORDER BY 
    PARTYNAME DESC;
  FOR idx IN 1.. party.COUNT
  LOOP
   DBMS_OUTPUT.PUT_LINE( party(idx));
  END LOOP;
END;
/
---------------------------------------------------------------------------------------

--4. Find how many Candidates participated in the year West Bengal 1988? 
--> Query
SELECT 
  COUNT(CAND_NAME) "Candidates Count"
FROM 
  ELECTION
WHERE 
  ST_NAME = 'West Bengal'
AND  
  YEAR = 2014;

--> Function

CREATE OR REPLACE FUNCTION WB_CAND_1988
RETURN VARCHAR
IS
  wb_cand NUMBER;
BEGIN
  SELECT 
    COUNT(CAND_NAME) INTO wb_cand
  FROM 
    ELECTION
  WHERE 
    ST_NAME = 'West Bengal'
  AND  
    YEAR = 2014;
  RETURN 'Total Candidates of West Bengal in the Year 1988 : '||wb_cand;
END;
/
----------------------------------------------------------------------------------------------------------    

--5.  Display the Tamilnadu Candidate list each year?
--> Query
SELECT 
  YEAR "Election Year",  CAND_NAME "Candidates" 
FROM 
  ELECTION 
WHERE 
  ST_NAME = 'Tamil Nadu' 
ORDER BY 
  YEAR;

EXPLAIN PLAN FOR
    SELECT 
      /*+NO_INDEX(ELECTION)*/YEAR "Election Year",  CAND_NAME "Candidates" 
    FROM 
      ELECTION 
    WHERE 
      ST_NAME = 'Tamil Nadu' 
    ORDER BY 
      YEAR;

SELECT
    PLAN_TABLE_OUTPUT
FROM
    TABLE(DBMS_XPLAN.DISPLAY);

-->Without Index  Query performance
/*
Plan hash value: 2629626777
		
-------------------------------------------------------------------------------
	
| Id | Operation | Name | Rows | Bytes | Cost (%CPU)| Time |
	
-------------------------------------------------------------------------------
	
| 0 | SELECT STATEMENT | | 5309 | 176K| 240 (1)| 00:00:01 |
	
| 1 | SORT ORDER BY | | 5309 | 176K| 240 (1)| 00:00:01 |
	
|* 2 | TABLE ACCESS FULL| ELECTION | 5309 | 176K| 239 (1)| 00:00:01 |
	
-------------------------------------------------------------------------------

-->With Index  Query performance

Plan hash value: 3362854993
		
---------------------------------------------------------------------------------------------------
	
| Id | Operation | Name | Rows | Bytes | Cost (%CPU)| Time |
	
---------------------------------------------------------------------------------------------------
	
| 0 | SELECT STATEMENT | | 5309 | 176K| 83 (2)| 00:00:01 |
	
| 1 | SORT ORDER BY | | 5309 | 176K| 83 (2)| 00:00:01 |
	
| 2 | TABLE ACCESS BY INDEX ROWID BATCHED| ELECTION | 5309 | 176K| 82 (0)| 00:00:01 |
	
|* 3 | INDEX RANGE SCAN | INDEX_NAME | 5309 | | 17 (0)| 00:00:01 |
	
---------------------------------------------------------------------------------------------------
*/

--> Procedure

CREATE OR REPLACE PROCEDURE TAMILNADU_CAND_LIST_YEAR
IS
  TYPE NAME_TYPE IS TABLE OF VARCHAR(100);
  TYPE COUNT_TYPE IS TABLE OF NUMBER;
  election_year COUNT_TYPE;
  c_name NAME_TYPE;
BEGIN
  SELECT 
    YEAR,CAND_NAME 
  BULK 
    COLLECT 
  INTO 
    election_year,c_name
  FROM 
    ELECTION 
  WHERE 
    ST_NAME = 'Tamil Nadu' 
  ORDER BY YEAR;
  FOR idx IN 1..election_year.COUNT
  LOOP
    DBMS_OUTPUT.PUT_LINE(election_year(idx)||' '||c_name(idx));
  END LOOP;
END;
/
--------------------------------------------------------------------

--> PL/SQL EXECUTION
--1.
BEGIN
  BJPCAND_ANI_1984();
END;
/
--2.
BEGIN
  MALE_CAND_STATE();
END;
/
--3.
BEGIN
  PARTIES();
END;
/
--4.
SELECT 
  WB_CAND_1988() 
FROM 
  DUAL;
--5.
BEGIN
  TAMILNADU_CAND_LIST_YEAR();
END;
/

DECLARE
    starting_time  TIMESTAMP WITH TIME ZONE;
    ending_time    TIMESTAMP WITH TIME ZONE;
BEGIN
   SELECT SYSTIMESTAMP INTO starting_time FROM DUAL;
   TAMILNADU_CAND_LIST_YEAR();
   SELECT SYSTIMESTAMP INTO ending_time FROM DUAL;
   DBMS_OUTPUT.PUT_LINE('Time = ' || TO_CHAR(ending_time - starting_time));
END;
/

--Time = +000000000 00:00:00.010041000