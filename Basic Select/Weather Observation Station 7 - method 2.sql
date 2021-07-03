SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY REGEXP "^.*[aeiou]$"; /* test ending with vowels */