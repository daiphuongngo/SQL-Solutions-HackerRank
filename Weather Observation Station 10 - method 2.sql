SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY NOT REGEXP '[aiueo]$'; /* do not end with vowels */

