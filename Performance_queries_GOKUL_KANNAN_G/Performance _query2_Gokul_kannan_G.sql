--1. Display the BJP candidate list participated at state Andaman & Nicobar Islands in the year 1984?
select CAND_NAME FROM Election WHERE ST_NAME = 'Andaman & Nicobar Islands' and Partyabbre = 'BJP' and year = 1988;

--2. How many Male Candidates participated in elections in each state?
SELECT COUNT(CAND_NAME), ST_NAME FROM ELECTION WHERE CAND_SEX = 'M' GROUP BY ST_NAME;

--3. Display the Party name in descending order?
SELECT PARTYNAME FROM ELECTION GROUP BY PARTYNAME ORDER BY PARTYNAME DESC;

--4. Find how many Candidates participated in the year West Bengal 1988?
SELECT COUNT(CAND_NAME) FROM ELECTION WHERE ST_NAME = 'West Bengal' and year = 1988;

--5. Display the Tamilnadu Candidate list each year?
SELECT CAND_NAME , year FROM ELECTION WHERE ST_NAME = 'Tamil Nadu' order by  year;