SELECT * FROM ELECTION;
SELECT ELECTION_ID FROM ELECTION WHERE ELECTION_TYPE = 'MLA';
SELECT ELECTION_ID,ELECTION_TYPE FROM ELECTION; 
SELECT ELECTION_ID,RESULT_DATE FROM ELECTION;
SELECT ELECTION_ID,ELECTION_DATE,RESULT_DATE FROM ELECTION;
SELECT ELECTION_ID,ELECTION_DATE,RESULT_DATE FROM ELECTION WHERE ELECTION_TYPE = 'MLA';
SELECT ELECTION_ID,ELECTION_DATE,RESULT_DATE FROM ELECTION WHERE ELECTION_TYPE = 'MP';
SELECT ELECTION_TYPE FROM ELECTION;
