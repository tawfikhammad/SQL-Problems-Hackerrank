select  COUNTRY.Continent , FLOOR(avg(city.population))
from city
join country on CITY.CountryCode = COUNTRY.Code 
group by COUNTRY.Continent;
