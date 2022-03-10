
--1. Display the BJP candidate list participated at state Andaman & Nicobar Islands in the year 1984?

select * from election where ST_NAME='Andaman & Nicobar Islands' and year=2014 and PARTYABBRE='BJP' ;


--2. How many Male Candidates participated in elections in each state?

SELECT COUNT(CAND_NAME),ST_NAME FROM ELECTION WHERE CAND_SEX='M' GROUP BY ST_NAME;



--3. Display the Party name in descending order?

select partyname from election order by partyname desc;

-- 4.Find how many Candidates participated in the year West Bengal 1988?

select count(cand_name) from election where st_name='West Bengal' and year=1988;

CREATE OR REPLACE procedure can_wb
IS
  w_c NUMBER;
BEGIN
  SELECT COUNT(CAND_NAME) INTO w_c FROM  ELECTION WHERE  ST_NAME = 'West Bengal' AND  YEAR = 2014;
  dbms.output.put_line(w_c);
END;
/
begin 
can_wb();
end;
/

-- 5.Display the Tamilnadu Candidate list each year?

select cand_name ,year from election where st_name ='Tamil Nadu';








