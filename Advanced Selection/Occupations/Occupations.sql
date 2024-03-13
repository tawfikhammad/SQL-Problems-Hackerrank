select Doctor, Professor, Singer, Actor 
from (select *, row_number() over(partition by Occupation order by Name asc) as id
from  OCCUPATIONS) as ranked

PIVOT(
    max(name) 
    FOR Occupation IN (
        [Doctor], 
        [Professor], 
        [Singer], 
        [Actor] 
        )
) AS pivot_table;
