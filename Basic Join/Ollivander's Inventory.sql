/* Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.

Hermione decides the best way to choose is by determining the minimum number of gold galleons needed 
to buy each non-evil wand of high power and age. Write a query to print the id, age, coins_needed, 
and power of the wands that Ron's interested in, sorted in order of descending power. 
If more than one wand has same power, sort the result in order of descending age. */


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