SELECT DISTINCT CITY 
FROM STATION
WHERE CITY REGEXP '^[^aeiou]';

/* Putting a ^ inside the closed brackets means something completely different than putting it outside the brackets. 
Putting it inside the brackets makes it match all characters EXCEPT the ones inside the brackets. 
So instead of writing [bcdfghjklmnpqrstvwxyz], we can write [^aeiou]

Putting a ^ outside the closed brackets to test if the output contains the char in the brackets. */