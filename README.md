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

### 
```

```
### 
```

```
### 
```

```
### 
```

```
### 
```

```
### 
```

```
### 
```

```
### 
```

```
### 
```

```
