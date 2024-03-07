select sum(city.population)
from city
join country on CITY.CountryCode = COUNTRY.Code 
where COUNTRY.CONTINENT = 'Asia'
