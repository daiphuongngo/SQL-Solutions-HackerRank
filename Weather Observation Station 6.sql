SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY REGEXP "^[aeiou].*"; /* placing .* at the end to test for beginning with a vowel */
