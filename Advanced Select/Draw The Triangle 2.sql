/* P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):

* 
* * 
* * * 
* * * * 
* * * * *
Write a query to print the pattern P(20). */

SET @ROW := 0;
SELECT REPEAT('* ', @ROW := @ROW + 1) FROM INFORMATION_SCHEMA.TABLES
WHERE @ROW < 20;