SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY REGEXP '[^aiueo]$'; /* do not end with vowels */

