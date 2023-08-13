with stat as (
    select Id, Company, Salary, count(*) over (partition by Company) as cnt, 
        row_number() over (partition by Company order by Salary) as rnk 
    from Employee 
)
select Id, Company, Salary 
from stat
where case when cnt%2=0 then rnk=cnt/2 or rnk=1+(cnt/2) 
           else rnk=1+(cnt/2) end
order by Company, Salary