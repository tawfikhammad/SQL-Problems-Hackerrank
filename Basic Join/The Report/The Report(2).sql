SELECT 
    CASE
        WHEN grade >= 8 THEN Name
        ELSE NULL
    END AS Name,
    grade,
    marks
FROM 
    Students
JOIN 
    Grades ON marks BETWEEN min_mark AND max_mark
ORDER BY 
    CASE WHEN grade >= 8 THEN grade END DESC,
    Name ASC,
    CASE WHEN grade < 8 THEN grade END DESC,
    marks asc;
