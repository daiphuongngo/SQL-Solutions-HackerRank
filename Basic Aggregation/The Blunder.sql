/* Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, 
but did not realize her keyboard's  key was broken until after completing the calculation. 
She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.

Write a query calculating the amount of error (i.e.: acutal - miscalculated average monthly salaries), 
and round it up to the next integer. */

/* Explanation

The table below shows the salaries without zeros as they were entered by Samantha:

Samantha computes an average salary of 98.00. The actual average salary is 2159.00.

The resulting error between the two calculations is 2159.00 - 98.00. Since it is equal to the integer 2061, 
it does not get rounded up. */

SELECT CEIL(AVG(SALARY) - AVG(REPLACE(SALARY, '0', '')))  /* # replace all occurances of '0' in Salary with '' */
FROM EMPLOYEES;

/*CEIL() because they have asked u to round up the error to its next integer, not to its nearest integer. 
We would have used Round() if they had told u to return its nearest integer.*