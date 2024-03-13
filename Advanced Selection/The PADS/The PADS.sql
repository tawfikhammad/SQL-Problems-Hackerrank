select concat(name, '(', substring(occupation,1,1),')')
from OCCUPATIONS
order by name;

select concat('There are a total of ', cnt ,' ', lower(occupation) ,'s.')
from (select occupation , count(*) as cnt from occupations group by occupation) as counted
order by cnt, occupation
;
