CREATE TABLE ELECTION_TABLE_VOTING_V (ELECTION_I VARCHAR(20),		
		  ELECTION_TYPE VARCHAR(50) NOT NULL,
		     ELECTION_DATE DATE NOT NULL,
		     RESULT_DATE DATE NOT NULL,
		CONSTRAINT ELECTION_I_PK PRIMARY KEY(ELECTION_I));
		

--desc election;

--select * from election;


--states table
		CREATE TABLE STATE_TABLE_V(STATE_IDS	NUMBER,
		           STATE_NAME 	VARCHAR(50) UNIQUE NOT NULL,
		CONSTRAINT STATE_IDS_PK PRIMARY KEY(STATE_IDS));
		
--desc states;
--select * from states;
		
--state_info table
		CREATE TABLE STATE_INFO_V (STATE_NAMES VARCHAR(50),
		                   STATE_POPULATION NUMBER NOT NULL,
		               		LOKSABHA_CONSTITUENCY NUMBER NOT NULL,	
		                   LEGISLATIVE_CONSTITUENCY NUMBER NOT NULL,
		CONSTRAINT STATE_NAMES_PK PRIMARY KEY(STATE_NAMES));
		
--desc state_info;
--select * from state_info;

--district table		

		CREATE TABLE DISTRICT_V (STATE_IDS NUMBER NOT NULL,
		                 DISTRICT_IDS NUMBER,
		CONSTRAINT DISTRICT_IDS_PK  PRIMARY KEY(DISTRICT_IDS),
		CONSTRAINT STATE_IDS_FK FOREIGN KEY(STATE_IDS) REFERENCES STATE_TABLE_V(STATE_IDS) ON DELETE CASCADE);
		
--desc district;
--select * from district;
		
--district_info

		CREATE TABLE DISTRICT_INFO_V(DISTRICT_IDS NUMBER NOT NULL,
		                          DISTRICT_NAMES VARCHAR(32),
		                          TOTAL_POPULATION NUMBER NOT NULL,
		CONSTRAINT	DISTRICT_NAMES_PK PRIMARY KEY(DISTRICT_NAMES),
		CONSTRAINT	DISTRICT_IDS_FK FOREIGN KEY(DISTRICT_IDS) REFERENCES DISTRICT_v(DISTRICT_IDS) ON DELETE CASCADE);
		

--desc district_info;
--select * from district_info;

--constituency
		CREATE TABLE CONSTITUENCY_V (DISTRICT_IDS NUMBER NOT NULL,
		                          CONSTITUENCY_IDS NUMBER,
		CONSTRAINT CONSTITUENCY_IDS_PK PRIMARY KEY(CONSTITUENCY_IDS),
		CONSTRAINT DISTRICT_IDS_CONS_FK FOREIGN KEY(DISTRICT_IDS) REFERENCES DISTRICT_v(DISTRICT_IDS) ON DELETE CASCADE);
		
--desc constituency;
--select * from constituency;
		
--constitutency_info
		CREATE TABLE CONSTITUENCY_INFO_V (CONSTITUENCY_IDS NUMBER NOT NULL,
		                         CONSTITUENCY_NAMES VARCHAR(32),
		              				    TOTAL_POPULATION NUMBER	NOT NULL,
                                        ELECTION_IDS VARCHAR(20) NOT NULL,
		CONSTRAINT	CONSTITUENCY_NAMES_PK PRIMARY KEY(CONSTITUENCY_NAMES),
		CONSTRAINT CONSTITUENCY_IDS_FK FOREIGN KEY(CONSTITUENCY_IDS) REFERENCES CONSTITUENCY_V(CONSTITUENCY_IDS) ON DELETE CASCADE);
		
desc constituency_info;
select * from constituency_info;

		
--voters
		CREATE TABLE VOTER_V (FIRST_NAME VARCHAR(32) NOT NULL,
						    MIDDLE_NAME	VARCHAR(32),
		           LAST_NAME VARCHAR(32) NOT NULL,
			          VOTER_ID NUMBER UNIQUE NOT NULL,
		           DATE_OF_BIRTH DATE NOT NULL,
		           AGE NUMBER NOT NULL,
		           AADHAARS	VARCHAR(32),
		           GENDER VARCHAR(32)	NOT NULL,
		           PASSWORD VARCHAR(20)UNIQUE NOT NULL,
		CONSTRAINT AADHAARS_vote_PK PRIMARY KEY(AADHAARS));


--desc voter;
--select * from voter;

--city 		

		CREATE TABLE CITY_V(ZIP_CODES	NUMBER,
					      CITY_NAME VARCHAR(32)	NOT NULL,
		CONSTRAINT ZIP_CODES_PK PRIMARY KEY(ZIP_CODES));		
		
--desc city;
--select * from city;
		
--address
		CREATE TABLE  ADDRESS__Vote(VAADHAAR   VARCHAR(32) primary key,
						STATE_IDS		NUMBER     NOT NULL,
						DISTRICT_IDS		NUMBER     NOT NULL,
						CONSTITUENCY_IDS	NUMBER     NOT NULL,
						ZIP_CODES		NUMBER     NOT NULL,
						PHONE_NUMBER	NUMBER     NOT NULL);
		--CONSTRAINT AADHAAR_PK  PRIMARY KEY(VAADHAAR),
		--CONSTRAINT ADD_VAADHAARS_FK FOREIGN KEY(VAADHAAR) REFERENCES VOTER(AADHAAR) ON DELETE CASCADE,
		--CONSTRAINT ADD_STATE_IDS_FK FOREIGN KEY(STATE_IDS) REFERENCES STATE_table_V(STATE_IDS) ON DELETE CASCADE,
		--CONSTRAINT ADD_DISTRICT_IDS_FK FOREIGN KEY(DISTRICT_IDS) REFERENCES DISTRICT_v(DISTRICT_IDS) ON DELETE CASCADE,
		--CONSTRAINT ADD_CONSTITUENCY_IDS_FK FOREIGN KEY(CONSTITUENCY_IDS) REFERENCES CONSTITUENCY_v(CONSTITUENCY_IDS) ON DELETE CASCADE,
		--CONSTRAINT ADD_ZIP_CODES_FK FOREIGN KEY(ZIP_CODES) REFERENCES CITY_v(ZIP_CODES) ON DELETE CASCADE);
--desc address;
--select * from address;

--party		

		CREATE TABLE PARTY_V(PARTY_IDS NUMBER PRIMARY KEY,
		                 PARTY_NAMES VARCHAR(32) UNIQUE NOT NULL
                         );
--desc party;
--select * from party;

--candidate_type 

		CREATE TABLE CANDIDATE_TYPE_V (CANDIDATETYPE_IDS NUMBER,
		                          CANDIDATETYPE_NAMES VARCHAR(32)  NOT NULL,
		CONSTRAINT CANDIDATETYPE_IDS_PK  PRIMARY KEY(CANDIDATETYPE_IDS)) ;
		
--desc candidate_type;
--select * from candidate_type;

--party_info
		CREATE TABLE PARTY_INFO_V(PARTY_NAMES VARCHAR(32) NOT NULL, SYMBOL VARCHAR(32) UNIQUE NOT NULL,
		                       PARTY_LEADER VARCHAR(32));
		                       --FOREIGN KEY(PARTY_NAMES) REFERENCES PARTY_V(PARTY_NAMES));

--rop table party_info_v;
		
--desc party_info;
--select * from party_info;		
		
--candidate 
		CREATE TABLE CANDIDATE1_V(CANDIDATE_IDS NUMBER PRIMARY KEY,
		                      CANDIDATETYPE_IDS NUMBER NOT NULL,
		                      AADHAAR VARCHAR(32) NOT NULL,
		                      NAME VARCHAR(32) NOT NULL,
		                      ELECTION_IDS	VARCHAR(32) NOT NULL,
		                      PARTY_IDS NUMBER NOT NULL);
		--CONSTRAINT CAN_CANDIDATETYPE_ID_FK FOREIGN KEY (CANDIDATETYPE_ID) REFERENCES CANDIDATE_TYPE (CANDIDATETYPE_ID) ON DELETE CASCADE,
		--CONSTRAINT CAN_AADHAR_FK FOREIGN KEY(AADHAAR) REFERENCES VOTER(AADHAAR) ON DELETE CASCADE,
		--CONSTRAINT CAN_ELECTION_ID_FK FOREIGN KEY (ELECTION_ID) REFERENCES ELECTION(ELECTION_ID) ON DELETE CASCADE,
		--CONSTRAINT CAN_PARTY_ID_FK FOREIGN KEY(PARTY_ID) REFERENCES PARTY(PARTY_ID) ON DELETE CASCADE);
--drop table candidate;
--select * from candidate;


--vote_pooling

		CREATE TABLE VOTE_POOLING_V (AADHAAR VARCHAR(32) NOT NULL PRIMARY KEY,
		                          ELECTION_IDS VARCHAR(32)  NOT NULL,
		                          CANDIDATE_IDS NUMBER NOT NULL,
                                  constituency_idS number not null,
                                  district_idS number not null);
		--CONSTRAINT VOTE_POOL_AADHAR_FK FOREIGN KEY(AADHAAR) REFERENCES VOTER(AADHAAR) ON DELETE CASCADE,
		--CONSTRAINT VOTE_POOL_ELECTION_ID_FK FOREIGN KEY(ELECTION_ID) REFERENCES ELECTION(ELECTION_ID) ON DELETE CASCADE,
		--CONSTRAINT VOTE_POOL_CANDIDATE_ID_FK FOREIGN KEY(CANDIDATE_ID) REFERENCES CANDIDATE(CANDIDATE_ID) ON DELETE CASCADE);
--drop table vote_pooling;
--DELETE FROM VOTE_POOLING

	
--desc vote_pooling;
--drop table vote_pooling;
		
--vote_count
		CREATE TABLE VOTE_COUNT_V(CANDIDATE_IDS  NUMBER primary key,
		                       ELECTION_IDS VARCHAR(32) NOT NULL,
		                       VOTE_COUNT NUMBER DEFAULT 0);
	--	CONSTRAINT VOTE_COU_CANDIDATE_ID_PK PRIMARY KEY(CANDIDATE_ID),
	--	CONSTRAINT VOTE_COU_CANDIDATE_ID_FK FOREIGN KEY(CANDIDATE_ID) REFERENCES CANDIDATE(CANDIDATE_ID) ON DELETE CASCADE,
	--	CONSTRAINT VOTE_COU_ELECTION_ID_FK FOREIGN KEY(ELECTION_ID) REFERENCES ELECTION(ELECTION_ID) ON DELETE CASCADE);
--drop table vote_count;

--legislative_voted_population
		CREATE TABLE LEGISLATIVE_VOTED_POPULATION_V(Constituency_idS number,
		                                     Election_idS varchar(32) NOT NULL,
		                                     voted_population number DEFAULT 0,
		                                     Total_population number NOT NULL,
		PRIMARY KEY (Constituency_idS),
		--FOREIGN KEY (Election_idS)  REFERENCES ELECTION_TABLE_VOTING_V(ELECTION_IDS)  ON DELETE CASCADE,
		FOREIGN KEY (Constituency_idS) REFERENCES constituency_v (constituency_idS) ON DELETE CASCADE
		);
		
--desc LEGISLATIVE_VOTED_POPULATION;

--lokshaba_voted_population
    
		CREATE TABLE LOKSHABA_VOTED_POPULATION_V(Election_idS VARCHAR(32),
		                                       district_idS number NOT NULL,
		                                       voted_population number  DEFAULT 0,
		                                       Total_population number NOT NULL,
		PRIMARY KEY (district_idS),
		FOREIGN KEY (Election_idS)  REFERENCES ELECTION_TABLE_VOTING (Election_idS)  ON DELETE CASCADE,
		FOREIGN KEY (district_idS) REFERENCES DISTRICT_V (district_idS) ON DELETE CASCADE
		);
--desc lokshaba_voted_population;

--LEGISLATIVE_RESULT
		

		CREATE TABLE LEGISLATIVE_RESULT_V(Candidate_idS number primary key,
		                             party_idS number ,
		                             Election_idS VARCHAR(32) not null,
		                             Constituency_idS number not null,
		                             vote_count number  not null,
		                             vote_diff number   not null,
		                             Status varchar2(32),
		
		FOREIGN KEY (party_idS)  REFERENCES party_v (party_idS)  ON DELETE CASCADE,
		FOREIGN KEY (Election_idS)  REFERENCES ELECTION_TABLE_VOTING (election_idS)  ON DELETE CASCADE,
	FOREIGN KEY (constituency_idS) REFERENCES CONSTITUENCY_V (constituency_idS) ON DELETE CASCADE
	);
--drop table LEGISLATIVE_RESULT;
--lokshaba_result
		CREATE TABLE LOKSHABA_RESULT_V(Candidate_idS number,
		                           party_idS number NOT NULL,
		                           Election_idS VARCHAR(32) NOT NULL,
		                           district_idS number NOT NULL,
		                           vote_count number DEFAULT 0,
		                           vote_diff number DEFAULT 0,
		                           Status varchar2(32),
		PRIMARY KEY (candidate_idS) );
--		FOREIGN KEY (candidate_id)  REFERENCES candidate (candidate_id)  ON DELETE CASCADE,
--		FOREIGN KEY (party_id)  REFERENCES party (party_id)  ON DELETE CASCADE,
--		FOREIGN KEY (Election_id)  REFERENCES Election (election_id)  ON DELETE CASCADE,
--		FOREIGN KEY (district_id) REFERENCES district (district_id) ON DELETE CASCADE);
--drop table LOKSHABA_RESULT;

