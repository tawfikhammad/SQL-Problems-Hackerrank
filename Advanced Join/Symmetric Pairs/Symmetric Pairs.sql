with new_table as 
(
select  f1.x, f1.Y 
from functions f1 left join (select x,y from functions group by X,Y having count(*)=1 and x=y) f2
on f1.x = f2.x and f1.y = f2.y
where f2.x is null

)
select distinct new1.X, new1.y
from new_table new1  join new_table new2 
on new1.X = new2.Y and new1.Y = new2.X and new1.X <= new1.Y
order by new1.X;
