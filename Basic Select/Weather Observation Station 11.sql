SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY 
NOT REGEXP '^[AEIOU]' /* either do not start with vowels */ 
OR CITY 
NOT REGEXP '[AEIOU]$'; /* or do not end with vowels. */ 