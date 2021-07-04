/* We define an employee's total earnings to be their monthly salary x month worked, and the maximum total earnings to be the maximum total earnings 
for any employee in the Employee table. Write a query to find the maximum total earnings for all employees 
as well as the total number of employees who have maximum total earnings. 
Then print these values as  space-separated integers.

Explanation

The table and earnings data is depicted in the following diagram:

The maximum earnings value is . The only employee with earnings  is Kimberly, so we print the maximum earnings value () 
and a count of the number of employees who have earned  (which is ) as two space-separated values. */

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

