delete 
from Person 
where (Id,Email) not in (select min(Id),Email 
                         from Person 
                         group by Email);
select * from Person;
