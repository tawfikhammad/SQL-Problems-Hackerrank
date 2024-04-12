with cte as (
    select *, lag(End_Date, 1) over (order by Start_Date ) as laged,
    lead(Start_Date , 1) over (order by Start_Date ) as leaded
    from Projects
),
cte2 as (select
    case 
        when laged is null then Start_Date 
        when Start_Date  != laged then Start_Date 
    end as start_date,
    case 
        when leaded is null then End_Date
        when End_Date != leaded then End_Date
    end as end_date 
from cte),

start_date_table as (select row_number() over(order by start_date) rowed, start_date from cte2 where start_date is not null),
end_date_table as (select row_number() over(order by end_date) rowed, end_date from cte2 where end_date is not null)

select s.start_date, e.end_date
from start_date_table s join end_date_table e on s.rowed = e.rowed
ORDER BY e.end_date - s.start_date, s.start_date;
