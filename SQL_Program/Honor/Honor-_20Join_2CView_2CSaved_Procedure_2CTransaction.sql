SELECT COLNAME, TYPENAME, LENGTH
  FROM SYSCAT.COLUMNS
  WHERE TABNAME='CENSUS_DATA';
SELECT COLNAME, TYPENAME, LENGTH
  FROM SYSCAT.COLUMNS
  WHERE TABNAME='CHICAGO_PUBLIC_SCHOOLS';
SELECT COLNAME, TYPENAME, LENGTH
  FROM SYSCAT.COLUMNS
  WHERE TABNAME='CHICAGO_CRIME_DATA'; 

-- EXERCISE ONE --JOINS 
SELECT CD.HARDSHIP_INDEX,CPS.NAME_OF_SCHOOL, CD.COMMUNITY_AREA_NAME, CPS.AVERAGE_STUDENT_ATTENDANCE
FROM CHICAGO_PUBLIC_SCHOOLS AS CPS
LEFT OUTER JOIN CENSUS_DATA AS CD 
ON CPS.COMMUNITY_AREA_NUMBER=CD.COMMUNITY_AREA_NUMBER
WHERE CD.HARDSHIP_INDEX =98;

SELECT CCD.CASE_NUMBER, CCD.PRIMARY_TYPE, CD.COMMUNITY_AREA_NAME,CCD.LOCATION_DESCRIPTION 
FROM CHICAGO_CRIME_DATA AS CCD
FULL OUTER JOIN CENSUS_DATA AS CD 
ON CCD.COMMUNITY_AREA_NUMBER=CD.COMMUNITY_AREA_NUMBER
WHERE CCD.LOCATION_DESCRIPTION LIKE '%SCHOOL%';

--EXERCISE TWO-- VIEW 
CREATE VIEW C_PUBLIC_SCHOOLS AS 
SELECT NAME_OF_SCHOOL "School_Name", SAFETY_ICON "Satety_Rating",
FAMILY_INVOLVEMENT_ICON "Family_Rating"
, ENVIRONMENT_ICON "Environment_Rating", 
INSTRUCTION_ICON "Instruction_Rating",
LEADERS_ICON "Leaders_Rating",
TEACHERS_ICON "Teacher_Rating"
FROM CHICAGO_PUBLIC_SCHOOLS;
SELECT * FROM C_PUBLIC_SCHOOLS;

--DROP VIEW C_PUBLIC_SCHOOLS;

SELECT "School_Name", "Leaders_Rating"
FROM C_PUBLIC_SCHOOLS;


-- EXERCISE THREE -- CREATING A STORED PROCEDURE 


----#SET TERMINATOR @
--CREATE PROCEDURE UPDATE_LEADERS_SCORE (
--    IN in_School_ID  INTEGER, IN in_Leader_Score INTEGER) 
--LANGUAGE SQL 
--MODIFIES SQL DATA
--  BEGIN
--    UPDATE CHICAGO_PUBLIC_SCHOOLS
--    SET Leaders_Score = in_Leader_Score
--    WHERE School_ID = in_School_ID;
--    IF in_Leader_Score >=  80 THEN 
--        UPDATE CHICAGO_PUBLIC_SCHOOLS
--        SET Leaders_Icon = 'Very_Strong'
--        WHERE School_ID = in_School_ID;
--    ELSEIF in_Leader_Score>= 60 and in_Leader_Score <= 79  THEN
--        UPDATE CHICAGO_PUBLIC_SCHOOLS
--        SET Leaders_Icon = 'Strong'
--        WHERE School_ID = in_School_ID;
--    ELSEIF in_Leader_Score >=  40 and in_Leader_Score <= 59  THEN
--        UPDATE CHICAGO_PUBLIC_SCHOOLS
--        SET Leaders_Icon = 'Average'
--        WHERE School_ID = in_School_ID;
--    ELSEIF in_Leader_Score >=  20 and in_Leader_Score <= 39  THEN
--        UPDATE CHICAGO_PUBLIC_SCHOOLS
--        SET Leaders_Icon = 'Weak'
--        WHERE School_ID = in_School_ID;
--    ELSE
--        UPDATE CHICAGO_PUBLIC_SCHOOLS
--        SET Leaders_Icon = 'Very Weak'
--        WHERE School_ID = in_School_ID;
--        END IF;
--  END 
--  @
-- 
--CALL UPDATE_LEADERS_SCORE(10,'50');

--EXERCISE 4 
--#SET TERMINATOR @
--CREATE OR REPLACE PROCEDURE UPDATE_LEADERS_SCORE (
--    IN in_School_ID  INTEGER, IN in_Leader_Score INTEGER) 
--LANGUAGE SQL 
--MODIFIES SQL DATA
--  BEGIN
--    UPDATE CHICAGO_PUBLIC_SCHOOLS
--    SET Leaders_Score = in_Leader_Score
--    WHERE School_ID = in_School_ID;
--    IF in_Leader_Score >=  80 THEN 
--        UPDATE CHICAGO_PUBLIC_SCHOOLS
--        SET Leaders_Icon = 'Very_Strong'
--        WHERE School_ID = in_School_ID;
--    ELSEIF in_Leader_Score>= 60 and in_Leader_Score <= 79  THEN
--        UPDATE CHICAGO_PUBLIC_SCHOOLS
--        SET Leaders_Icon = 'Strong'
--        WHERE School_ID = in_School_ID;
--    ELSEIF in_Leader_Score >=  40 and in_Leader_Score <= 59  THEN
--        UPDATE CHICAGO_PUBLIC_SCHOOLS
--        SET Leaders_Icon = 'Average'
--        WHERE School_ID = in_School_ID;
--    ELSEIF in_Leader_Score >=  20 and in_Leader_Score <= 39  THEN
--        UPDATE CHICAGO_PUBLIC_SCHOOLS
--        SET Leaders_Icon = 'Weak'
--        WHERE School_ID = in_School_ID;
--    ELSEIF in_Leader_Score >=0 and in_Leader_Score<=19 THEN
--        UPDATE CHICAGO_PUBLIC_SCHOOLS
--        SET Leaders_Icon = 'Very Weak'
--        WHERE School_ID = in_School_ID;
--	ELSE 
--		ROLLBACK WORK; 
--    	END IF;
--    	COMMIT WORK; 
--  END 
--  @
 
 CALL UPDATE_LEADER_SCORE(2,38);
 CALL UPDATE_LEADER_SCORE(4,101);