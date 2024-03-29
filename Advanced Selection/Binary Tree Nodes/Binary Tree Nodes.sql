SELECT N,
    (CASE 
        WHEN N NOT IN (SELECT DISTINCT P FROM BST WHERE P IS NOT NULL)  THEN 'Leaf'
        WHEN P IS NULL THEN 'Root'
        ELSE 'Inner'
    END) AS outcome
FROM BST
ORDER BY N; 
