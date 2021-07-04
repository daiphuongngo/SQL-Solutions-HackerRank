/* You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.
Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

Root: If node is root node.
Leaf: If node is leaf node.
Inner: If node is neither root nor leaf node. */ 

SELECT CASE
    WHEN P IS NULL THEN CONCAT(N, ' Root')
    WHEN N IN (SELECT DISTINCT P FROM BST) THEN CONCAT(N, ' Inner') /* If any of the nodes in column 'N' are in Parent column 'P' it will be treated as an inner node. */
    ELSE CONCAT(N, ' Leaf') /* Else, it will be a leaf node as the entry in 'N' column is not a parent to any other node. */
    END
FROM BST
ORDER BY N ASC;


