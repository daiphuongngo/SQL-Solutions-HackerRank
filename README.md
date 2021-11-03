# SQL-Solutions-HackerRank

## Overview:

This repository contains solutions of SQL HackerRank challenges which I had completed and collected for practice purpose.

## Language:

- SQL

## Challenges:

### Basic Select:

#### Employee Names

Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order. 
```
SELECT NAME 
FROM EMPLOYEE
ORDER BY NAME;
```

### Employee Salaries

Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than  per month who have been employees for less than 10 months. Sort your result by ascending employee_id. 
```
SELECT NAME FROM EMPLOYEE
WHERE SALARY > 2000 AND MONTHS < 10
ORDER BY EMPLOYEE_ID;
```

### Higher Than 75 Marks

Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
```
SELECT NAME 
FROM STUDENTS 
WHERE MARKS > 75 
ORDER BY RIGHT(NAME, 3), ID ASC;
```

### Japanese Cities' Attributes
```
SELECT *
FROM CITY
WHERE COUNTRYCODE = 'JPN';
```

### Japanese Cities' Names
```
SELECT NAME
FROM CITY
WHERE COUNTRYCODE = 'JPN';
```

### Revising the Select Query I
```
CREATE TABLE CITY2
(ID int,
NAME varchar(17),
COUNTRYCODE varchar(3),
DISTRICT varchar(20),
POPULATIONS int,
)

SELECT *
FROM CITY2
WHERE
    COUNTRYCODE = 'USA'
    AND POPULATIONS > 100000;
```

### Revising the Select Query II
```
SELECT NAME
FROM CITY
WHERE 
COUNTRYCODE = 'USA' AND POPULATION > 120000;
```

### Select All
```
ALTER TABLE CITY
ADD POPULATION INT;

SELECT *
FROM CITY;
```

### Select By ID
```
SELECT *
FROM CITY
WHERE ID = 1661;
```
### Weather Observation Station 1
```
SELECT CITY, STATE 
FROM STATION;
```

### Weather Observation Station 3
```
SELECT DISTINCT(CITY) /* Print the results in any order, but exclude duplicates from the answer. */
FROM STATION 
WHERE (ID % 2) = 0; /* even ID number */
```

### Weather Observation Station 4
```
SELECT COUNT(CITY) - COUNT(DISTINCT CITY) 
FROM STATION;
```

### Weather Observation Station 5

Return the city with the longest name and the city with the shortest name (with city name sort order as a tie breaker).

"limit 1": each query only returns the first result, thus returning the longest and shortest city names.

```
SELECT CITY, LENGTH(CITY) FROM STATION
ORDER BY LENGTH(CITY), CITY ASC
LIMIT 1;
SELECT CITY, LENGTH(CITY) FROM STATION
ORDER BY LENGTH(CITY) DESC
LIMIT 1;
```

### Weather Observation Station 6

Method 1
```
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY REGEXP "^[aeiou].*"; /* placing .* at the end to test for beginning with a vowel */
```

Method 2
```
SELECT DISTINCT CITY 
FROM STATION 
WHERE LEFT(CITY, 1) 
IN ('a','i','e','o','u');
```

### Weather Observation Station 7

Method 1
```
SELECT DISTINCT CITY 
FROM STATION 
WHERE RIGHT(CITY, 1) 
IN ('a','i','e','o','u');
```

Method 2
```
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY REGEXP "^.*[aeiou]$"; /* test ending with vowels */
```

### Weather Observation Station 8
```
SELECT DISTINCT CITY FROM STATION
WHERE LEFT(CITY, 1) 
IN ('a','e','i','o','u') 
AND RIGHT(CITY, 1)
IN ('a','e','i','o','u');
```

### Weather Observation Station 9

Putting a ^ inside the closed brackets means something completely different than putting it outside the brackets. 

Putting it inside the brackets makes it match all characters EXCEPT the ones inside the brackets. 

So instead of writing [bcdfghjklmnpqrstvwxyz], we can write [^aeiou].

Putting a ^ outside the closed brackets to test if the output contains the char in the brackets. 

```
SELECT DISTINCT CITY 
FROM STATION
WHERE CITY REGEXP '^[^aeiou]';
```

### Weather Observation Station 10

Method 1
```
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY REGEXP '[^aiueo]$'; /* do not end with vowels */
```

Method 2
```
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY NOT REGEXP '[aiueo]$'; /* do not end with vowels */
```

### Weather Observation Station 11

Method 1
```
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY 
NOT REGEXP '^[AEIOU]' /* either do not start with vowels */ 
OR CITY 
NOT REGEXP '[AEIOU]$'; /* or do not end with vowels. */ 
```

Method 2
```

SELECT DISTINCT CITY 
FROM STATION 
WHERE LEFT(CITY, 1) NOT IN ('A', 'E', 'I', 'O', 'U') 
OR RIGHT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u')
```

### Weather Observation Station 12

Method 1

Do not start with vowels and do not end with vowels.
```
SELECT DISTINCT CITY
FROM STATION
WHERE LEFT(CITY, 1) NOT IN ('a','e','i','o','u')
AND RIGHT(CITY, 1) NOT IN ('a','e','i','o','u');
```

Method 2

Do not start with vowels and do not end with vowels.

. is representing one character and .. is representing two characters and soon .* is representing as many characters you want.

. is to specify a character and * is to mention zero or more of the preceding character.

[^aeiou] -> should not match any character aeiou

^[^aeiou] -> should not match first character with aeiou

The ^ in brackets negates.
```
SELECT DISTINCT CITY
FROM STATION 
WHERE CITY REGEXP '^[^aeiou].*[^aeiou]$'; /* .* in between to have "and" */
```
