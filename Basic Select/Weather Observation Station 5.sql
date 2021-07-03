SELECT CITY, LENGTH(CITY) FROM STATION
ORDER BY LENGTH(CITY), CITY ASC
LIMIT 1;
SELECT CITY, LENGTH(CITY) FROM STATION
ORDER BY LENGTH(CITY) DESC
LIMIT 1;

/* return the city with the longest name and the city with the shortest name (with city name sort order as a tie breaker)
"limit 1": each query only returns the first result, thus returning the longest and shortest city names.*/