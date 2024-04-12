with cte1 as ( 
    select submission_date, hacker_id 
    from submissions s 
    where hacker_id in ( 
        select hacker_id 
        from submissions s2 
        where s2.submission_date <= s.submission_date 
        group by hacker_id 
        having count(distinct submission_date) = ( 
                select count(distinct submission_date) 
                from submissions s3 
                where s3.submission_date <= s.submission_date ) ) ),

cte2 as ( 
    select submission_date, count(distinct hacker_id) as subs 
    from cte1 
    group by submission_date ), 
    
cte3 as ( 
    select s.submission_date, s.hacker_id, h.name, count(*) as subs 
    from submissions s inner join hackers h on s.hacker_id = h.hacker_id 
    group by s.submission_date, s.hacker_id, h.name ),
    
cte4 as ( select submission_date, hacker_id, name, subs, row_number() over(partition by submission_date order by subs desc, hacker_id) as rnk 
    from cte3 )
    
select cte2.submission_date, cte2.subs, cte4.hacker_id, cte4.name 
from cte2 
inner join cte4 
on cte2.submission_date = cte4.submission_date 
where cte4.rnk = 1
