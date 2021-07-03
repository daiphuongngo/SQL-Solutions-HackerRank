create table CITY2
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