/* You did such a great job helping Julia with her last coding contest challenge that she wants you to work on this one, too!

The total score of a hacker is the sum of their maximum scores for all of the challenges. 
Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. Exclude all hackers with a total score of  from your result. */

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