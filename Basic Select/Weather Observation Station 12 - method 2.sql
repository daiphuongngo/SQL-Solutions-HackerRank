SELECT DISTINCT CITY
FROM STATION 
WHERE CITY REGEXP '^[^aeiou].*[^aeiou]$'; /* .* in between to have "and" */

/* do not start with vowels and do not end with vowels */

/* . is representing one character and .. is representing two characters and soon .* is representing as many characters u want */
/* . is to specify a character and * is to mention zero or more of the preceding character */

/*[^aeiou] -> should not match any character aeiou

^[^aeiou] -> should not match first character with aeiou

The ^ in brackets negates.*/