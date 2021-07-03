SELECT DISTINCT(CITY) /* Print the results in any order, but exclude duplicates from the answer. */
FROM STATION 
WHERE (ID % 2) = 0; /* even ID number */