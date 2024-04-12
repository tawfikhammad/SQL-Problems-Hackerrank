DECLARE @start INT = 1;
 
WHILE @start <= 20
    BEGIN
        PRINT(REPLICATE('* ', @start));
        SET @start = @start + 1;
    END;
