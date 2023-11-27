SELECT COLNAME,TYPENAME, LENGTH FROM SYSCAT.COLUMNS 
WHERE TABNAME='CENSUS_DATA';

SELECT COLNAME, TYPENAME, LENGTH FROM SYSCAT.COLUMNS 
WHERE TABNAME= 'CHICAGO_PUBLIC_SCHOOLS';

SELECT COLNAME, TYPENAME, LENGTH FROM SYSCAT.COLUMNS 
WHERE TABNAME= 'CHICAGO_CRIME_DATA';

SELECT CASE_NUMBER, PRIMARY_TYPE,COMMUNITY_AREA_NAME
FROM CHICAGO_CRIME_DATA AS CCD
INNER JOIN CENSUS_DATA AS CD 
ON CCD.COMMUNITY_AREA_NUMBER=CD.COMMUNITY_AREA_NUMBER
WHERE CCD.COMMUNITY_AREA_NUMBER = 18;

SELECT CASE_NUMBER,PRIMARY_TYPE,COMMUNITY_AREA_NAME
FROM CHICAGO_CRIME_DATA AS CCD 
INNER JOIN CENSUS_DATA AS CD 
ON CCD.COMMUNITY_AREA_NUMBER=CD.COMMUNITY_AREA_NUMBER
WHERE CCD.LOCATION_DESCRIPTION LIKE '%SCHOOL%';

SELECT DISTINCT(COMMUNITY_AREA_NAME) FROM CENSUS_DATA;  
SELECT COMMUNITY_AREA_NAME,CCD.COMMUNITY_AREA_NUMBER, CCD.CASE_NUMBER
 FROM CHICAGO_CRIME_DATA AS CCD 
 FULL OUTER JOIN CENSUS_DATA AS CD 
 ON CCD.COMMUNITY_AREA_NUMBER=CD.COMMUNITY_AREA_NUMBER
 WHERE CD.COMMUNITY_AREA_NAME IN ('Oakland','Armour Square','Edgewater'); 
