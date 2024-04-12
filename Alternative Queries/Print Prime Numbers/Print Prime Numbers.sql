with cte as (
    select 
        x.value as num, 
        y.value as divisor, 
        x.value % y.value as rem
    from generate_series(1, 1000) as x, generate_series(1, 1000) as y
    where y.value <= sqrt(x.value) and x.value % y.value = 0
), cte2 as (
    select num
    from cte
    where num != 1
    group by num
    having count(*) = 1
)
select STRING_AGG(num, '&')
from cte2
