/* Julia asked her students to create some coding challenges. 
Write a query to print the hacker_id, name, and the total number of challenges created by each student. 
Sort your results by the total number of challenges in descending order. 
If more than one student created the same number of challenges, then sort the result by hacker_id. 
If more than one student created the same number of challenges and the count is less than the maximum number 
of challenges created, then exclude those students from the result. */


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