with e as
(select
 x,
 y,
 row_number() over (order by x,y) rn
from functions)

select distinct e.x, e.y
from e
join e as e2
 on e.x = e2.y 
 and e2.x = e.y
 and e.rn != e2.rn
where e.x <= e.y
order by e.x
