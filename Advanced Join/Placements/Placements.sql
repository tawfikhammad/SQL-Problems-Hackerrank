select name
from (select Friends.ID, Friend_ID, Salary from  Friends join Packages on Friends.Friend_ID = Packages.ID) fr_salary join (select Students.ID, name, salary  from  Students join Packages on  Students.ID = Packages.ID ) st_salary

on fr_salary.id = st_salary.id
where fr_salary.salary > st_salary.salary
order by fr_salary.salary;
