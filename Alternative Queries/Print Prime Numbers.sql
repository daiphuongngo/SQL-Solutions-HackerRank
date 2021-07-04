/* Write a query to print all prime numbers less than or equal to 1000. 
Print your result on a single line, and use the ampersand () character as your separator (instead of a space).

For example, the output for all prime numbers <= 10 would be:

2&3&5&7 */

SELECT GROUP_CONCAT(NUM_B SEPARATOR '&')
FROM (
    SELECT @num:=@num+1 as NUM_B FROM
    information_schema.tables t1,
    information_schema.tables t2,
    (SELECT @num:=1) tmp
) tempNum
WHERE NUM_B <= 1000 AND NOT EXISTS(
        SELECT * FROM (
            SELECT @number := @number+1 as NUM_A FROM
                information_schema.tables t1,
                information_schema.tables t2,
                (SELECT @number := 1) tmp1
                LIMIT 1000
            ) temp
        WHERE FLOOR(NUM_B/NUM_A) = (NUM_B/NUM_A) AND NUM_A < NUM_B AND NUM_A > 1
    );
