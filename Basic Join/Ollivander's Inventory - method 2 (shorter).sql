/* Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.

Hermione decides the best way to choose is by determining the minimum number of gold galleons needed 
to buy each non-evil wand of high power and age. Write a query to print the id, age, coins_needed, 
and power of the wands that Ron's interested in, sorted in order of descending power. 
If more than one wand has same power, sort the result in order of descending age. */


SELECT W.id, P.age, W.coins_needed, W.power
FROM WANDS AS W
    INNER JOIN WANDS_PROPERTY AS P ON W.code = P.code
WHERE P.is_evil = 0 AND W.coins_needed = 
    (SELECT MIN(coins_needed)
     FROM WANDS AS W1
        INNER JOIN WANDS_PROPERTY AS P1 ON W1.code = P1.code
     WHERE W1.power = W.power AND P1.age = P.age)
ORDER BY W.power DESC, P.age DESC;