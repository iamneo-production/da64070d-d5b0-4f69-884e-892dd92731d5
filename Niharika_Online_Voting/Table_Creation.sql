--table creation
--election table
CREATE TABLE ELECTION_A_N (ELECTION_ID_A VARCHAR(20) PRIMARY KEY,		
		  ELECTION_TYPE VARCHAR(50) NOT NULL,
		     ELECTION_DATE DATE NOT NULL,
		     RESULT_DATE DATE NOT NULL);
		--CONSTRAINT ELECTION_ID_A_PK PRIMARY KEY(ELECTION_ID_A));
		

--desc election_a;

--select * from election_a;


--states table
		CREATE TABLE STATES_A_N(STATE_ID_A	NUMBER PRIMARY KEY,
		           STATE_NAME 	VARCHAR(50) UNIQUE NOT NULL);
		--CONSTRAINT STATE_ID_A_PK PRIMARY KEY(STATE_ID_A));
		
--desc states_a;
--select * from states_a;
		
--state_info_an table
		CREATE TABLE STATE_INFO_A_N (STATE_NAME_A VARCHAR(50) PRIMARY KEY,
		                   STATE_POPULATION NUMBER NOT NULL,
		               		LOKSABHA_CONSTITUENCY NUMBER NOT NULL,	
		                   LEGISLATIVE_CONSTITUENCY NUMBER NOT NULL);
		--CONSTRAINT STATE_NAME_A_PK PRIMARY KEY(STATE_NAME_A));
		
--desc state_info_a;
--select * from state_info_a;

--district_a table		

		CREATE TABLE DISTRICT_A_N (STATE_ID_A NUMBER NOT NULL PRIMARY KEY,
		                 DISTRICT_ID_A NUMBER);
	--	CONSTRAINT DISTRICT_ID_A_PK  PRIMARY KEY(DISTRICT_ID_A),
	--	CONSTRAINT STATE_ID_A_FK FOREIGN KEY(STATE_ID_A) REFERENCES STATES_A(STATE_ID_A) ON DELETE CASCADE);
		
--desc district;
--select * from district;
		
--district_info_a

		CREATE TABLE DISTRICT_INFO_A_N(DISTRICT_ID_A NUMBER NOT NULL PRIMARY KEY,
		                          DISTRICT_NAME_A VARCHAR(32),
		                          TOTAL_POPULATION NUMBER NOT NULL);
		--CONSTRAINT	DISTRICT_NAME_A_PK PRIMARY KEY(DISTRICT_NAME_A),
	--	CONSTRAINT	DISTRICT_ID_A_FK FOREIGN KEY(DISTRICT_ID_A) REFERENCES DISTRICT_A(DISTRICT_ID_A) ON DELETE CASCADE);
		

--desc district_info;
--select * from district_info;

--constituency-a
		CREATE TABLE CONSTITUENCY_A_N (DISTRICT_ID_A NUMBER NOT NULL PRIMARY KEY,
		                          CONSTITUENCY_ID_A NUMBER);
		--CONSTRAINT CONSTITUENCY_ID_A_PK PRIMARY KEY(CONSTITUENCY_ID_A),
		--CONSTRAINT DISTRICT_ID_A_CONS_FK FOREIGN KEY(DISTRICT_ID_A) REFERENCES DISTRICT_A(DISTRICT_ID_A) ON DELETE CASCADE);
		
--desc constituency_a;
--select * from constituency_a;
		
--constitutency_info_a
		CREATE TABLE CONSTITUENCY_INFO_A_N (CONSTITUENCY_ID_A NUMBER PRIMARY KEY,
		                         CONSTITUENCY_NAME_A VARCHAR(32),
		              				    TOTAL_POPULATION NUMBER	NOT NULL,
                                        ELECTION_ID_A VARCHAR(20) NOT NULL);
		--CONSTRAINT	CONSTITUENCY_NAME_A_PK PRIMARY KEY(CONSTITUENCY_NAME_A),
		--CONSTRAINT CONSTITUENCY_ID_A_FK FOREIGN KEY(CONSTITUENCY_ID_A) REFERENCES CONSTITUENCY_A(CONSTITUENCY_ID_A) ON DELETE CASCADE);
		
--desc constituency_info_a;
--select * from constituency_info_a;

		
--voters
		CREATE TABLE VOTER_A_N (FIRST_NAME VARCHAR(32) NOT NULL PRIMARY KEY,
						    MIDDLE_NAME	VARCHAR(32),
		           LAST_NAME VARCHAR(32) NOT NULL,
			          VOTER_ID NUMBER UNIQUE NOT NULL,
		           DATE_OF_BIRTH DATE NOT NULL,
		           AGE NUMBER NOT NULL,
		           AADHAAR_A	VARCHAR(32),
		           GENDER VARCHAR(32)	NOT NULL,
		           PASSWORD VARCHAR(20)UNIQUE NOT NULL);
		--CONSTRAINT AADHAAR_vote_A_PK PRIMARY KEY(AADHAAR_A));


--desc voter;
--select * from voter_a;

--city 		

		CREATE TABLE CITY_A_N(ZIP_CODE_A	NUMBER PRIMARY KEY,
					      CITY_NAME VARCHAR(32)	NOT NULL);
	--	CONSTRAINT ZIP_CODE_A_PK PRIMARY KEY(ZIP_CODE_A));		
		
--desc city_a;
--select * from city_a;
		
--address
		CREATE TABLE  ADDRESS_A_N(VAADHAAR_A   VARCHAR(32) PRIMARY KEY,
						STATE_ID_A		NUMBER     NOT NULL,
						DISTRICT_ID_A	NUMBER     NOT NULL,
						CONSTITUENCY_ID_A	NUMBER     NOT NULL,
						ZIP_CODE_A		NUMBER     NOT NULL,
						PHONE_NUMBER	NUMBER     NOT NULL);
		--CONSTRAINT AADHAAR_A_PK  PRIMARY KEY(VAADHAAR_A),
		--CONSTRAINT ADD_VAADHAAR_A_FK FOREIGN KEY(VAADHAAR_A) REFERENCES VOTER_A(AADHAAR_A) ON DELETE CASCADE,
	--	CONSTRAINT ADD_STATE_ID_A_FK FOREIGN KEY(STATE_ID_A) REFERENCES STATES_A(STATE_ID_A) ON DELETE CASCADE,
	--	CONSTRAINT ADD_DISTRICT_ID_A_FK FOREIGN KEY(DISTRICT_ID_A) REFERENCES DISTRICT_A(DISTRICT_ID_A) ON DELETE CASCADE,
	--	CONSTRAINT ADD_CONSTITUENCY_ID_A_FK FOREIGN KEY(CONSTITUENCY_ID_A) REFERENCES CONSTITUENCY_A(CONSTITUENCY_ID_A) ON DELETE CASCADE,
	--	CONSTRAINT ADD_ZIP_CODE_A_FK FOREIGN KEY(ZIP_CODE_A) REFERENCES CITY_A(ZIP_CODE_A) ON DELETE CASCADE);
--desc address-a;
--select * from address_a;
--party		

		CREATE TABLE PARTY_A_N (PARTY_ID_A NUMBER PRIMARY KEY,
		                 PARTY_NAME VARCHAR(32) UNIQUE NOT NULL
                         );
--desc party_a;
--select * from party;

--candidate_type 

		CREATE TABLE CANDIDATE_TYPE_A_N (CANDIDATETYPE_ID_A NUMBER PRIMARY KEY,
		                          CANDIDATETYPE_NAME VARCHAR(32)  NOT NULL);
		--CONSTRAINT CANDIDATETYPE_ID_A_PK  PRIMARY KEY(CANDIDATETYPE_ID_A)) ;
		
--desc candidate_type_a;
--select * from candidate_type_a;

--party_info
		CREATE TABLE PARTY_INFO_AN(PARTY_NAME_A VARCHAR(32) NOT NULL, SYMBOL VARCHAR(32) UNIQUE NOT NULL,
		                       PARTY_LEADER VARCHAR(32));
		                   --    FOREIGN KEY(PARTY_NAME_A) REFERENCES PARTY(PARTY_NAME));
		
--desc party_info_a;
--select * from party_info_a;		
		
--candidate 
		CREATE TABLE CANDIDATE_A_N(CANDIDATE_ID_A NUMBER PRIMARY KEY,
		                      CANDIDATETYPE_ID NUMBER NOT NULL,
		                      AADHAAR VARCHAR(32) NOT NULL,
		                      NAME VARCHAR(32) NOT NULL,
		                      ELECTION_ID	VARCHAR(32) NOT NULL,
		                      PARTY_ID NUMBER NOT NULL);
		--CONSTRAINT CAN_CANDIDATETYPE_ID_FK FOREIGN KEY (CANDIDATETYPE_ID) REFERENCES CANDIDATE_TYPE (CANDIDATETYPE_ID) ON DELETE CASCADE,
		--CONSTRAINT CAN_AADHAR_FK FOREIGN KEY(AADHAAR) REFERENCES VOTER(AADHAAR) ON DELETE CASCADE,
		--CONSTRAINT CAN_ELECTION_ID_FK FOREIGN KEY (ELECTION_ID) REFERENCES ELECTION(ELECTION_ID) ON DELETE CASCADE,
		--CONSTRAINT CAN_PARTY_ID_FK FOREIGN KEY(PARTY_ID) REFERENCES PARTY(PARTY_ID) ON DELETE CASCADE);
--drop table candidate;
--select * from candidate;


--vote_pooling

		CREATE TABLE VOTE_POOLING_A_N (AADHAAR VARCHAR(32) NOT NULL PRIMARY KEY,
		                          ELECTION_ID VARCHAR(32)  NOT NULL,
		                          CANDIDATE_ID NUMBER NOT NULL,
                                  constituency_id number not null,
                                  district_id number not null);
		--CONSTRAINT VOTE_POOL_AADHAR_FK FOREIGN KEY(AADHAAR) REFERENCES VOTER(AADHAAR) ON DELETE CASCADE,
		--CONSTRAINT VOTE_POOL_ELECTION_ID_FK FOREIGN KEY(ELECTION_ID) REFERENCES ELECTION(ELECTION_ID) ON DELETE CASCADE,
		--CONSTRAINT VOTE_POOL_CANDIDATE_ID_FK FOREIGN KEY(CANDIDATE_ID) REFERENCES CANDIDATE(CANDIDATE_ID) ON DELETE CASCADE);
--drop table vote_pooling;
--DELETE FROM VOTE_POOLING

	
--desc vote_pooling;
--drop table vote_pooling;
		
--vote_count_a
		CREATE TABLE VOTE_COUNT_A_N(CANDIDATE_ID  NUMBER primary key,
		                       ELECTION_ID VARCHAR(32) NOT NULL,
		                       VOTE_COUNT NUMBER DEFAULT 0);
	--	CONSTRAINT VOTE_COU_CANDIDATE_ID_PK PRIMARY KEY(CANDIDATE_ID),
	--	CONSTRAINT VOTE_COU_CANDIDATE_ID_FK FOREIGN KEY(CANDIDATE_ID) REFERENCES CANDIDATE(CANDIDATE_ID) ON DELETE CASCADE,
	--	CONSTRAINT VOTE_COU_ELECTION_ID_FK FOREIGN KEY(ELECTION_ID) REFERENCES ELECTION(ELECTION_ID) ON DELETE CASCADE);
--drop table vote_count;

--legislative_voted_population_A
		CREATE TABLE LEGISLATIVE_VOTED_POPULATION_A_N(Constituency_id_A number PRIMARY KEY,
		                                     Election_id_A varchar(32) NOT NULL,
		                                     voted_population number DEFAULT 0,
		                                     Total_population number NOT NULL);
		--PRIMARY KEY (Constituency_id_A),
		--FOREIGN KEY (Election_id_A)  REFERENCES Election_A (Election_id_A)  ON DELETE CASCADE,
		--FOREIGN KEY (Constituency_id_A) REFERENCES constituency_A (constituency_id_A) ON DELETE CASCADE
		
		
--desc LEGISLATIVE_VOTED_POPULATION;

--lokshaba_voted_population_A
    
		CREATE TABLE LOKSHABA_VOTED_POPULATION_A_N(Election_id_A VARCHAR(32) ,
		                                       district_id_A number NOT NULL PRIMARY KEY,
		                                       voted_population number  DEFAULT 0,
		                                       Total_population number NOT NULL);
	--	PRIMARY KEY (district_id_A),
	--	FOREIGN KEY (Election_id_A)  REFERENCES Election_A (Election_id_A)  ON DELETE CASCADE,
	--	FOREIGN KEY (district_id_A) REFERENCES district_A (district_id_A) ON DELETE CASCADE
		);
--desc lokshaba_voted_population_a;

--LEGISLATIVE_RESULT_A
		

		CREATE TABLE LEGISLATIVE_RESULT_A_N(Candidate_id_A number primary key,
		                             party_id_A number ,
		                             Election_id VARCHAR(32) not null,
		                             Constituency_id number not null,
		                             vote_count number  not null,
		                             vote_diff number   not null,
		                             Status varchar2(32));
		
	--	FOREIGN KEY (party_id_A)  REFERENCES party_A (party_id_A)  ON DELETE CASCADE,
	--	FOREIGN KEY (Election_iD)  REFERENCES Election_A (election_id_A)  ON DELETE CASCADE,
	--FOREIGN KEY (constituency_id) REFERENCES constituency_A (constituency_id_A) ON DELETE CASCADE
	--);
--drop table LEGISLATIVE_RESULT;
--lokshaba_result_a
		CREATE TABLE LOKSHABA_RESULT_A_N(Candidate_id_A number PRIMARY KEY,
		                           party_id number NOT NULL,
		                           Election_id VARCHAR(32) NOT NULL,
		                           district_id number NOT NULL,
		                           vote_count number DEFAULT 0,
		                           vote_diff number DEFAULT 0,
		                           Status varchar2(32) );
	--	PRIMARY KEY (candidate_id_A) );
--		FOREIGN KEY (candidate_id)  REFERENCES candidate (candidate_id)  ON DELETE CASCADE,
--		FOREIGN KEY (party_id)  REFERENCES party (party_id)  ON DELETE CASCADE,
--		FOREIGN KEY (Election_id)  REFERENCES Election (election_id)  ON DELETE CASCADE,
--		FOREIGN KEY (district_id) REFERENCES district (district_id) ON DELETE CASCADE);
--drop table LOKSHABA_RESULT;