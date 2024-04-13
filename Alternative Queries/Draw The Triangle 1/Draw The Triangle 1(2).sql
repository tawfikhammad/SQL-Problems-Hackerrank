with cte_numbers(n, star) as (
    select  20,  CAST(REPLICATE('* ', 20) AS VARCHAR(MAX))  
    union all
    select  n - 1, CAST(REPLICATE('* ', n - 1) AS VARCHAR(MAX))
    from  cte_numbers
    where n > 1
)
select star
from cte_numbers;
