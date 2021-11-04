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

## Basic Join

### African Cities
Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns. 

```
SELECT CITY.NAME
FROM CITY INNER JOIN COUNTRY
ON COUNTRYCODE = CODE
WHERE CONTINENT = 'Africa'

/*using inner join*/
```

### Average Population of Each Continent

Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
```
SELECT COUNTRY.CONTINENT, FLOOR(AVG(CITY.POPULATION))
FROM CITY INNER JOIN COUNTRY
ON CITY.COUNTRYCODE = COUNTRY.CODE
GROUP BY COUNTRY.CONTINENT;

/* Group by country.continent: Since the population column in the city table has populations city wise but the question asks us to get the population of continents.*/
```

### Challenges

Julia asked her students to create some coding challenges. 

Write a query to print the hacker_id, name, and the total number of challenges created by each student. 

Sort your results by the total number of challenges in descending order. 

If more than one student created the same number of challenges, then sort the result by hacker_id. 

If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.

```
SELECT a.hacker_id, a.name, COUNT(b.hacker_id)    
FROM Hackers a, Challenges b
WHERE a.hacker_id = b.hacker_id
GROUP BY a.hacker_id,a.name
HAVING COUNT(b.hacker_id) NOT IN
    (SELECT DISTINCT COUNT(hacker_id) 
     FROM Challenges
     WHERE hacker_id <> a.hacker_id
     GROUP BY hacker_id
     HAVING COUNT(hacker_id) < 
     (SELECT MAX(x.challenge_count)
      FROM (SELECT COUNT(b.challenge_id) AS challenge_count
            FROM Challenges b
            GROUP BY b.hacker_id) AS x ))
ORDER BY COUNT(b.hacker_id) DESC, a.hacker_id;
```

### Contest Leaderboard

You did such a great job helping Julia with her last coding contest challenge that she wants you to work on this one, too!

The total score of a hacker is the sum of their maximum scores for all of the challenges. 

Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. Exclude all hackers with a total score of  from your result. 

```
select h.hacker_id, name, sum(score) as total_score
from
hackers as h inner join

/* find max_score*/
(select hacker_id,  max(score) as score 
 from submissions 
 group by challenge_id, hacker_id) max_score

on h.hacker_id = max_score.hacker_id
group by h.hacker_id, name

/* don't accept hackers with total_score=0 */
having total_score > 0

/* finally order as required */
order by total_score desc, h.hacker_id;
```

### Ollivander's Inventory

Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.

Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age. Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. 

If more than one wand has same power, sort the result in order of descending age.

Method 1

```
SELECT WANDS.ID,
       MIN_PRICES.AGE,
       WANDS.COINS_NEEDED,
       WANDS.POWER
FROM WANDS
INNER JOIN
  (SELECT WANDS.CODE,
          WANDS.POWER,
          MIN(WANDS_PROPERTY.AGE) AS AGE,
          MIN(WANDS.COINS_NEEDED) AS MIN_PRICE
   FROM WANDS
   INNER JOIN WANDS_PROPERTY ON WANDS.CODE = WANDS_PROPERTY.CODE
   WHERE WANDS_PROPERTY.IS_EVIL = 0
   GROUP BY WANDS.CODE,
            WANDS.POWER) MIN_PRICES ON WANDS.CODE = MIN_PRICES.CODE
AND WANDS.POWER = MIN_PRICES.POWER
AND WANDS.COINS_NEEDED = MIN_PRICES.MIN_PRICE
ORDER BY WANDS.POWER DESC,
         MIN_PRICES.AGE DESC;
```

Method 2
```
SELECT W.id, P.age, W.coins_needed, W.power
FROM WANDS AS W
    INNER JOIN WANDS_PROPERTY AS P ON W.code = P.code
WHERE P.is_evil = 0 AND W.coins_needed = 
    (SELECT MIN(coins_needed)
     FROM WANDS AS W1
        INNER JOIN WANDS_PROPERTY AS P1 ON W1.code = P1.code
     WHERE W1.power = W.power AND P1.age = P.age)
ORDER BY W.power DESC, P.age DESC;
```

### Population Census 

Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

Not using join
```
SELECT CITY.NAME 
FROM CITY, COUNTRY
WHERE CODE = COUNTRYCODE AND CONTINENT = 'Africa';
```

Using double where
```
SELECT NAME 
FROM CITY
WHERE COUNTRYCODE IN (
    SELECT CODE 
    FROM COUNTRY
    WHERE CONTINENT = 'Africa');
```

Using inner join
```
SELECT SUM(CITY.POPULATION)
FROM CITY, COUNTRY
WHERE CITY.COUNTRYCODE = COUNTRY.CODE AND COUNTRY.CONTINENT = 'Asia';
```

### The Report

Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. 

Ketty doesn't want the NAMES of those students who received a grade lower than 8. 

The report must be in descending order by grade -- i.e. higher grades are entered first. 

If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. 

Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. 

If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.
```
SELECT IF(GRADE < 8, NULL, NAME), GRADE, MARKS
FROM STUDENTS JOIN GRADES
WHERE MARKS BETWEEN MIN_MARK and MAX_MARK
ORDER BY GRADE DESC, NAME;
© 2021 GitHub, Inc.
Terms
Privacy
```

### Top Competitors 

Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! 

Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. 

Order your output in descending order by the total number of challenges in which the hacker earned a full score. 

If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.

Inner join
```
select h.hacker_id, h.name
from submissions s
inner join challenges c
on s.challenge_id = c.challenge_id
inner join difficulty d
on c.difficulty_level = d.difficulty_level 
inner join hackers h
on s.hacker_id = h.hacker_id
where s.score = d.score 
group by h.hacker_id, h.name
having count(s.hacker_id) > 1
order by count(s.hacker_id) desc, s.hacker_id asc


/* The main thing is using having
/* join tables together, to make a master table which contains all the info */ select sub.hacker_id, hak.name from submissions sub join challenges cha on sub.challenge_id = cha.challenge_id join hackers hak on sub.hacker_id = hak.hacker_id join difficulty dif on cha.difficulty_level = dif.difficulty_level

/* filter logic, to eliminate submissions that did not earn full score */ where dif.score = sub.score

/* further eliminate hackers who only had one full-score submission */ group by sub.hacker_id, hak.name having count(sub.score) > 1

/* display by the order stated in the proble, */ order by count(sub.score) desc, sub.hacker_id */
```

## Basic Aggregation

### Average Population

Query the average population for all cities in CITY, rounded down to the nearest integer.
```
SELECT FLOOR(AVG(POPULATION))
FROM CITY;
```

### Japan Population

Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.
```
SELECT SUM(POPULATION)
FROM CITY
WHERE COUNTRYCODE = 'JPN';
```

### Population Density Difference

Query the difference between the maximum and minimum populations in CITY.
```
SELECT MAX(POPULATION) - MIN(POPULATION)
FROM CITY;
```

### Revising Aggregations - Averages

Query the average population of all cities in CITY where District is California.

```
SELECT AVG(POPULATION)
FROM CITY
WHERE DISTRICT = 'California';
```

### Revising Aggregations - The Count Function

Query a count of the number of cities in CITY having a Population larger than 100,000.
```
SELECT COUNT(POPULATION)
FROM CITY
WHERE POPULATION > 100000;
```

### Revising Aggregations - The Sum Function

Query the total population of all cities in CITY where District is California.
```
SELECT SUM(POPULATION)
FROM CITY
WHERE DISTRICT = 'California';
```

### The Blunder

Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's  key was broken until after completing the calculation. 

She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.

Write a query calculating the amount of error (i.e.: acutal - miscalculated average monthly salaries), and round it up to the next integer. 

Explanation

The table below shows the salaries without zeros as they were entered by Samantha:

Samantha computes an average salary of 98.00. The actual average salary is 2159.00.

The resulting error between the two calculations is 2159.00 - 98.00. Since it is equal to the integer 2061, it does not get rounded up.
```
SELECT CEIL(AVG(SALARY) - AVG(REPLACE(SALARY, '0', '')))  /* # replace all occurances of '0' in Salary with '' */
FROM EMPLOYEES;

/*CEIL() because they have asked u to round up the error to its next integer, not to its nearest integer. 
We would have used Round() if they had told u to return its nearest integer.*
```

### Top Earners

We define an employee's total earnings to be their monthly salary x month worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. 

Then print these values as  space-separated integers.

Explanation

The table and earnings data is depicted in the following diagram:

The maximum earnings value is . The only employee with earnings  is Kimberly, so we print the maximum earnings value () and a count of the number of employees who have earned  (which is ) as two space-separated values.
```
SELECT (SALARY * MONTHS) AS EARNINGS, 
COUNT(*) 
FROM EMPLOYEE 
GROUP BY 1 
ORDER BY EARNINGS DESC
LIMIT 1;

/*salary*month --- first to calculate total earnings we multiply month * salary
count() -- next for counting no of employees having that salary we use count()
group by 1 -- will take simple example..consider query SELECT name , id FROM employee group by 1; in this query there are 2 columns i.e., name and id...
So we have to group it by 1st column that is name.
order by earning desc -- it will order the table in desc order do that max value appears frst.
limit 1 -- it will limit the table to 1 row only. so the query displays the frst row only. */
```

### Weather Observation Station 2

Query the following two values from the STATION table:

The sum of all values in LAT_N rounded to a scale of 2 decimal places.

The sum of all values in LONG_W rounded to a scale of 2 decimal places.
```
SELECT ROUND(SUM(LAT_N), 2), ROUND(SUM(LONG_W), 2)
FROM STATION;
```

### Weather Observation Station 13

Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7800 and less than 137.2345. Truncate your answer to  decimal places.
```
SELECT ROUND(SUM(LAT_N), 4)
FROM STATION
WHERE LAT_N > 38.7880
AND LAT_N < 137.2345;
```

### Weather Observation Station 14

Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. 

Truncate your answer to 4 decimal places.
```
SELECT ROUND(MAX(LAT_N), 4)
FROM STATION
WHERE LAT_N < 137.2345;
```

### Weather Observation Station 15

Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345. 

Round your answer to 4 decimal places.
```
SELECT ROUND(LONG_W, 4)
FROM STATION 
WHERE LAT_N = (SELECT MAX(LAT_N)
	FROM STATION
	WHERE LAT_N < 137.2345);
```

### Weather Observation Station 16

Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780. Round your answer to 4 decimal places.
```
SELECT ROUND(MIN(LAT_N), 4)
FROM STATION 
WHERE LAT_N > 38.7780;
```

### Weather Observation Station 17

Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7780. 

Round your answer to 4 decimal places.

Method 1: Using LIMIT 1
```
SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N > 38.7780
ORDER BY LAT_N
LIMIT 1;
```

Method 2: Using subquery
```
SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (
	SELECT MIN(LAT_N)
	FROM STATION 
	WHERE LAT_N > 38.7880);
```

### Weather Observation Station 18 - Manhattan Distance

Consider P1(a, b) and P2(a, b) to be two points on a 2D plane.

a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).

b happens to equal the minimum value in Western Longitude (LONG_W in STATION).

c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).

d happens to equal the maximum value in Western Longitude (LONG_W in STATION).

Query the Manhattan Distance between points P1 and P2 and round it to a scale of  decimal places.
```
SELECT ROUND(ABS(MIN(LAT_N) - MAX(LAT_N)) + ABS(MIN(LONG_W) - MAX(LONG_W)), 4)
FROM STATION; 
```

### Weather Observation Station 19 - Euclidean Distance

Consider P1(a,b) and P2(c,d) to be two points on a 2D plane where (a,b) are the respective minimum and maximum values of Northern Latitude (LAT_N) and (c,d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.

Query the Euclidean Distance between points P1 and P2 and format your answer to display 4 decimal digits.

```
SELECT
    ROUND(SQRT(
        POWER(MAX(LAT_N)  - MIN(LAT_N),  2)
      + POWER(MAX(LONG_W) - MIN(LONG_W), 2)
    ), 4)
FROM 
    STATION;
```

### Weather Observation Station 20 - Median

A median is defined as a number separating the higher half of a data set from the lower half. 

Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.
```
SELECT ROUND(S.LAT_N,4) 
FROM STATION S 
WHERE (
    SELECT COUNT(LAT_N) 
    FROM STATION 
    WHERE LAT_N < S.LAT_N ) = (SELECT COUNT(LAT_N) 
                               FROM STATION 
                               WHERE LAT_N > S.LAT_N);
```

## Alternative Queries

### Draw The Triangle 1
```
SET @NUMBER = 21;
SELECT REPEAT('* ', @number := @number - 1) FROM INFORMATION_SCHEMA.TABLES;
```

### Draw The Triangle 2
```
SET @ROW := 0;
SELECT REPEAT('* ', @ROW := @ROW + 1) FROM INFORMATION_SCHEMA.TABLES
WHERE @ROW < 20;
```

### Print Prime Numbers

Write a query to print all prime numbers less than or equal to 1000. 

Print your result on a single line, and use the ampersand () character as your separator (instead of a space).

For example, the output for all prime numbers <= 10 would be:

2&3&5&7 
```
SELECT GROUP_CONCAT(NUM_B SEPARATOR '&')
FROM (
    SELECT @num:=@num+1 as NUM_B FROM
    information_schema.tables t1,
    information_schema.tables t2,
    (SELECT @num:=1) tmp
) tempNum
WHERE NUM_B <= 1000 AND NOT EXISTS(
        SELECT * FROM (
            SELECT @number := @number+1 as NUM_A FROM
                information_schema.tables t1,
                information_schema.tables t2,
                (SELECT @number := 1) tmp1
                LIMIT 1000
            ) temp
        WHERE FLOOR(NUM_B/NUM_A) = (NUM_B/NUM_A) AND NUM_A < NUM_B AND NUM_A > 1
    );
```

## Advanced Select

### Binary Tree Nodes

You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.

Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

Root: If node is root node.

Leaf: If node is leaf node.

Inner: If node is neither root nor leaf node.
```
SELECT CASE
    WHEN P IS NULL THEN CONCAT(N, ' Root')
    WHEN N IN (SELECT DISTINCT P FROM BST) THEN CONCAT(N, ' Inner') /* If any of the nodes in column 'N' are in Parent column 'P' it will be treated as an inner node. */
    ELSE CONCAT(N, ' Leaf') /* Else, it will be a leaf node as the entry in 'N' column is not a parent to any other node. */
    END
FROM BST
ORDER BY N ASC;
```

### Draw The Triangle 1

P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):

* * * * * 

* * * * 

* * * 

* * 

*

Write a query to print the pattern P(20).

```
SET @NUMBER = 21;
SELECT REPEAT('* ', @number := @number - 1) FROM INFORMATION_SCHEMA.TABLES;
```

### Draw The Triangle 2

P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):

*

* * 

* * * 

* * * * 

* * * * *

Write a query to print the pattern P(20).

```
SET @ROW := 0;
SELECT REPEAT('* ', @ROW := @ROW + 1) FROM INFORMATION_SCHEMA.TABLES
WHERE @ROW < 20;
```

### New Companies

Amber's conglomerate corporation just acquired some new companies. 

Each of the companies follows this hierarchy: 

Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.

Note:

The tables may contain duplicate records.

The company_code is string, so the sorting should not be numeric. 

For example, if the company_codes are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10, and C_2.

Method 1 - Not using join
```
select company_code, founder,
(select count(distinct lead_manager_code) from Lead_Manager where company_code = c.company_code),
(select count(distinct senior_manager_code) from Senior_Manager where company_code = c.company_code),
(select count(distinct manager_code) from Manager where company_code = c.company_code),
(select count(distinct employee_code) from Employee where company_code = c.company_code)
from Company c
order by company_code;
```
Using join 
```
select c.company_code, c.founder, 
    count(distinct e.lead_manager_code), 
    count(distinct e.senior_manager_code), 
    count(distinct e.manager_code), 
    count(distinct e.employee_code)
from company c
    inner join employee e on e.company_code = c.company_code
group by c.company_code, c.founder
order by c.company_code;
```

### Occupations

Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. 

The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

Note: Print NULL when there are no more names corresponding to an occupation.

Occupation will only contain one of the following values: Doctor, Professor, Singer or Actor.

Explanation

The first column is an alphabetically ordered list of Doctor names.

The second column is an alphabetically ordered list of Professor names.

The third column is an alphabetically ordered list of Singer names.

The fourth column is an alphabetically ordered list of Actor names.

The empty cell data for columns with less than the maximum number of names per occupation (in this case, the Professor and Actor columns) are filled with NULL values.
```
set @r1=0, @r2=0, @r3=0, @r4=0;
select min(Doctor), min(Professor), min(Singer), min(Actor)
from(
  select case when Occupation = 'Doctor' then (@r1:=@r1+1)
            when Occupation = 'Professor' then (@r2:=@r2+1)
            when Occupation = 'Singer' then (@r3:=@r3+1)
            when Occupation = 'Actor' then (@r4:=@r4+1) end as RowNumber,
    case when Occupation = 'Doctor' then Name end as Doctor,
    case when Occupation = 'Professor' then Name end as Professor,
    case when Occupation = 'Singer' then Name end as Singer,
    case when Occupation = 'Actor' then Name end as Actor
  from OCCUPATIONS
  order by Name
) Temp
group by RowNumber
```

### The PADS

Generate the following two result sets:

Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). 

For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).

Query the number of ocurrences of each occupation in OCCUPATIONS. 

Sort the occurrences in ascending order, and output them in the following format:

There are a total of [occupation_count] [occupation]s.

where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. 

If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.

Note: There will be at least two entries in the table for each type of occupation.

```
SELECT CONCAT(NAME, CONCAT('(', CONCAT(SUBSTR(OCCUPATION, 1, 1),')'))) FROM OCCUPATIONS ORDER BY NAME;

SELECT CONCAT('There are a total of', CONCAT(' ', CONCAT(count(OCCUPATION), CONCAT(' ', CONCAT(lower(OCCUPATION), 's.'))))) AS TOTAL FROM occupations
GROUP BY OCCUPATION ORDER BY TOTAL;
```

### Type of Triangle

Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. 

Output one of the following statements for each record in the table:

Equilateral: It's a triangle with 3 sides of equal length.

Isosceles: It's a triangle with 3 sides of equal length.

Scalene: It's a triangle with 3 sides of differing lengths.

Not A Triangle: The given values of A, B, and C don't form a triangle.

```
SELECT CASE             
    WHEN A + B > C AND B + C > A AND A + C > B THEN
        CASE /* case is considered as if */
            WHEN A = B AND B = C THEN 'Equilateral'
            WHEN A = B OR B = C OR A = C THEN 'Isosceles'
            ELSE 'Scalene'
        END /* must have end */
    ELSE 'Not A Triangle'
END /* must have end */
FROM TRIANGLES;
```

## Advanced Join:

### 15 Days of Learning SQL

Julia conducted a 15 days of learning SQL contest. 


The start date of the contest was March 01, 2016 and the end date was March 15, 2016.

Write a query to print total number of unique hackers who made at least  submission each day.

(starting on the first day of the contest), and find the hacker_id and name of the hacker who made maximum number of submissions each day. 

If more than one such hacker has a maximum number of submissions, print the lowest hacker_id. 

The query should print this information for each day of the contest, sorted by the date. 

Method 1
```
select submission_date, ( SELECT COUNT(distinct hacker_id)  
                        FROM Submissions s2  
                        WHERE s2.submission_date = s1.submission_date AND 
                        (SELECT COUNT(distinct s3.submission_date) 
                         FROM Submissions s3 
                         WHERE s3.hacker_id = s2.hacker_id AND  
         s3.submission_date < s1.submission_date) = dateDIFF(s1.submission_date , '2016-03-01')) ,

            (select hacker_id  from submissions s2 
             where s2.submission_date = s1.submission_date 
               group by hacker_id 
             order by count(submission_id) desc , hacker_id limit 1) as hack,
        (select name from hackers where hacker_id = hack)
        from 
        (select distinct submission_date from submissions) s1
        group by submission_date;
```

Method 2
```
SELECT 
    submission_date,
( SELECT 
 COUNT(distinct hacker_id)  
 FROM Submissions hackerCount  
 WHERE hackerCount.submission_date = dates.submission_date 
 AND (SELECT 
        COUNT(distinct submissionCount.submission_date) 
      FROM Submissions submissionCount 
      WHERE submissionCount.hacker_id = hackerCount.hacker_id 
      AND submissionCount.submission_date < dates.submission_date) 
                = dateDIFF(dates.submission_date , '2016-03-01')
     ) ,
( SELECT 
    hacker_id  
    FROM submissions hackerList 
    WHERE hackerList.submission_date = dates.submission_date 
    GROUP BY hacker_id 
    ORDER BY count(submission_id) DESC , hacker_id limit 1) as topHack,
(SELECT 
    name 
    FROM hackers 
    WHERE hacker_id = topHack)
    FROM (SELECT distinct submission_date from submissions) dates
    GROUP BY submission_date;
```

### Interviews

Samantha interviews many candidates from different colleges using coding challenges and contests. 

Write a query to print the contest_id, hacker_id, name, and the sums of total_submissions, 

total_accepted_submissions, total_views, and total_unique_views for each contest sorted by contest_id. Exclude the contest from the result if all four sums are.

Note: A specific contest can be used to screen candidates at more than one college, but each college only holds  screening contest.

Method 1
```
select con.contest_id,
        con.hacker_id, 
        con.name, 
        sum(total_submissions), 
        sum(total_accepted_submissions), 
        sum(total_views), sum(total_unique_views)
from contests con 
join colleges col on con.contest_id = col.contest_id 
join challenges cha on  col.college_id = cha.college_id 
left join
(select challenge_id, sum(total_views) as total_views, sum(total_unique_views) as total_unique_views
from view_stats group by challenge_id) vs on cha.challenge_id = vs.challenge_id 
left join
(select challenge_id, sum(total_submissions) as total_submissions, sum(total_accepted_submissions) as total_accepted_submissions from submission_stats group by challenge_id) ss on cha.challenge_id = ss.challenge_id
    group by con.contest_id, con.hacker_id, con.name
        having sum(total_submissions)!=0 or 
                sum(total_accepted_submissions)!=0 or
                sum(total_views)!=0 or
                sum(total_unique_views)!=0
            order by contest_id;
```

Method 2
```
SELECT A.contest_id, A.hacker_id, A.Name, 
        SUM(total_submissions) As total_submissions, 
        SUM(total_accepted_submissions) AS total_accepted_submissions,
        SUM(total_views) AS total_views,
        SUM(total_unique_views) AS total_unique_views
FROM Contests AS A
LEFT JOIN Colleges AS B
    ON A.contest_id = B.contest_id 
LEFT JOIN Challenges AS C
    ON B.college_id = C.college_id 
LEFT JOIN (SELECT challenge_id, SUM(total_views) AS total_views, 
                  SUM(total_unique_views) AS total_unique_views
           FROM View_Stats
           GROUP BY challenge_id) AS D 
    ON C.challenge_id = D.challenge_id 
LEFT JOIN (SELECT challenge_id, SUM(total_submissions) AS total_submissions, 
                  SUM(total_accepted_submissions) AS total_accepted_submissions
           FROM Submission_Stats
           GROUP BY challenge_id) AS E
    ON C.challenge_id = E.challenge_id 
GROUP BY A.contest_id, A.hacker_id, A.Name
HAVING (total_submissions + total_accepted_submissions + total_views + total_unique_views) > 0 
ORDER BY A.contest_id
;
```

### Placements
You are given three tables: Students, Friends and Packages. 

Students contains two columns: ID and Name. 

Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). 

Packages contains two columns: ID and Salary (offered salary in $ thousands per month).

Write a query to output the names of those students whose best friends got offered a higher salary than them. 

Names must be ordered by the salary amount offered to the best friends. 

It is guaranteed that no two students got same salary offer.
```
Select S.Name
From ( Students S join Friends F Using(ID)
       join Packages P1 on S.ID = P1.ID
       join Packages P2 on F.Friend_ID = P2.ID)
Where P2.Salary > P1.Salary
Order By P2.Salary;

/* create to 2 columns of Packages (salaries) with P1 as per S.ID and P2 as per F.Friend_ID
to compare if salaries of P2 > those of P1 and print by order of P2's salaries. */
```

### SQL Project Planning

You are given a table, Projects, containing three columns: Task_ID, Start_Date and End_Date. 

It is guaranteed that the difference between the End_Date and the Start_Date is equal to 1 day for each row in the table. 

If the End_Date of the tasks are consecutive, then they are part of the same project. Samantha is interested in finding the total number of different projects completed.

Write a query to output the start and end dates of projects listed by the number of days it took to complete the project in ascending order. 

If there is more than one project that have the same number of completion days, then order by the start date of the project.

Method 1
```
SELECT Start_Date, MIN(End_Date)
FROM 

/* Choose start dates that are not end dates of other projects (if a start date is an end date, 
it is part of the samee project) */
    (SELECT Start_Date FROM Projects WHERE Start_Date NOT IN (SELECT End_Date FROM Projects)) a,

/* Choose end dates that are not end dates of other projects */
    (SELECT end_date FROM PROJECTS WHERE end_date NOT IN (SELECT start_date FROM PROJECTS)) b,

/* At this point, we should have a list of start dates and end dates that don't necessarily correspond with each other */
/* This makes sure we only choose end dates that fall after the start date, and choosing the MIN means for the particular start_date, 
we get the closest end date that does not coincide with the start of another task */
WHERE start_date < end_date
GROUP BY start_date
ORDER BY datediff(start_date, MIN(end_date)) DESC, start_date;

/* Using min means that we want to get the closest day where the start_day < end_day, 
which means that the closest end day is the right end day where the one same project is finished. */
```

Method 2
```
SET sql_mode = '';
SELECT Start_Date, End_Date
FROM 
    (SELECT Start_Date FROM Projects WHERE Start_Date NOT IN (SELECT End_Date FROM Projects)) a,
    (SELECT End_Date FROM Projects WHERE End_Date NOT IN (SELECT Start_Date FROM Projects)) b, 
WHERE Start_Date < End_Date
GROUP BY Start_Date 
ORDER BY DATEDIFF(End_Date, Start_Date), Start_Date;
```

### Symmetric Pairs

You are given a table, Functions, containing two columns: X and Y.

Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1.

Write a query to output all such symmetric pairs in ascending order by the value of X. 

List the rows such that X1 ≤ Y1. 

```
SELECT f1.X, f1.Y FROM Functions f1
INNER JOIN Functions f2 ON f1.X = f2.Y AND f1.Y = f2.X
GROUP BY f1.X, f1.Y
HAVING COUNT(f1.X) > 1 or f1.X < f1.Y
ORDER BY f1.X;

/* inner join to add rows vertically */ 
```
