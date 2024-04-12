DECLARE @start INT = 20;
 
WHILE @start > 0
    BEGIN
        PRINT(RTRIM(REPLICATE('* ', @start)));
        SET @start = @start - 1;
    END;
