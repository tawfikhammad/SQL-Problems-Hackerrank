select  ROUND(AVG(LAT_N), 4)
from
(   select 
    LAT_N, 
    COUNT(*) OVER () AS num_rows,
    row_number() OVER (ORDER BY LAT_N) AS row_num
    from STATION
    ) as sorted_table

where (num_rows % 2 = 0 and row_num = num_rows/2 and row_num = (num_rows+2)/2)
    or
    (num_rows % 2 <> 0 and row_num = (num_rows+1)/2)
