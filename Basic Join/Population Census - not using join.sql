/* Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns. */

SELECT CITY.NAME 
FROM CITY, COUNTRY
WHERE CODE = COUNTRYCODE AND CONTINENT = 'Africa';

/* not using join */
