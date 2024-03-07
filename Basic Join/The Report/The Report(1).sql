SELECT 
    CASE
        WHEN grade >= 8 THEN Name
        ELSE NULL
    END AS Name,
    grade,
    marks
FROM 
    Students, Grades 
where marks BETWEEN min_mark AND max_mark
ORDER BY 
    grade DESC,
    Name ASC,
    marks asc;
