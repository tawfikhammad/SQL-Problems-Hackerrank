select distinct(city.name)
from city
join country on CITY.CountryCode = COUNTRY.Code 
where COUNTRY.CONTINENT = 'Africa';
