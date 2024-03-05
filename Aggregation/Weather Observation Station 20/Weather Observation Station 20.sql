WITH sorted_table AS (
    SELECT 
        LAT_N, 
        COUNT(*) OVER () AS num_rows,
        ROW_NUMBER() OVER (ORDER BY LAT_N) AS row_num
    FROM 
        STATION 
)
SELECT round(LAT_N, 4)
FROM sorted_table
WHERE 
    (num_rows % 2 = 0 AND LAT_N = (SELECT SUM(LAT_N)/2 FROM sorted_table WHERE row_num = num_rows/2 AND row_num = (num_rows+2)/2))
    OR
    (num_rows % 2 <> 0 AND LAT_N = (SELECT LAT_N FROM sorted_table WHERE row_num = (num_rows+1)/2)); 
