select id, age, filtered.coins_needed, filtered.power
from Wands w 
    join (select w.code, age, min(coins_needed) coins_needed, power
            from Wands w 
            join Wands_Property wp on w.code = wp.code and wp.is_evil = 0
            group by code, age, power) filtered
        where filtered.code = w.code 
        and filtered.coins_needed = w.coins_needed
        and filtered.power = w.power
 
order by filtered.power desc, age desc;
