SELECT DISTINCT CITY
FROM STATION
WHERE SUBSTRING(CITY FROM 1 FOR 1) IN ('A', 'E', 'I', 'O', 'U');

/* OR */

SELECT DISTINCT CITY  
FROM STATION
WHERE CITY LIKE 'a%' OR CITY LIKE 'e%' OR CITY LIKE 'i%' OR CITY LIKE 'o%' OR CITY LIKE 'u%';
