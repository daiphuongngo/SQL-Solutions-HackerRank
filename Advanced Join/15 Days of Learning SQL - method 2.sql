/* Julia conducted a 15 days of learning SQL contest. 
The start date of the contest was March 01, 2016 and the end date was March 15, 2016.

Write a query to print total number of unique hackers who made at least  submission each day 
(starting on the first day of the contest), and find the hacker_id and name of the hacker who made maximum number of submissions each day. If more than one such hacker has a maximum number of submissions, print the lowest hacker_id. 
The query should print this information for each day of the contest, sorted by the date. */

SELECT 
    submission_date ,
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