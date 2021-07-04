/* Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns. */

SELECT NAME 
FROM CITY
WHERE COUNTRYCODE IN (
    SELECT CODE 
    FROM COUNTRY
    WHERE CONTINENT = 'Africa');

/* using double where */