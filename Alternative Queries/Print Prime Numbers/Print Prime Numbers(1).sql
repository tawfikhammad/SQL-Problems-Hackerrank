DECLARE @NUM INT = 2 
DECLARE @counter INT 
DECLARE @is_prime BIT 
DECLARE @output VARCHAR(MAX) = ' '

WHILE @NUM <= 1000 
    BEGIN 
        SET @counter = 2 
        SET @is_prime = 1 
        WHILE @counter <= SQRT(@NUM)
            BEGIN 
                IF @NUM % @counter = 0 
                    BEGIN 
                        SET @is_prime = 0 
                        BREAK 
                    END 
                SET @counter += 1 
            END 
        IF @is_prime = 1 
            SET @output += CAST(@NUM AS VARCHAR(10))+ '&' 
            SET @NUM += 1 
            END 
        IF RIGHT(@output, 1) = '&' 
            SET @output = LEFT(@output, LEN(@output) - 1)

PRINT @output
