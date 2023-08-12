with stat as (
    select salary, count(*), row_number() over (order by salary) as team_id 
    from Employees 
    group by salary
    having count(*)>1
)
select E.employee_id, E.name, S.salary, S.team_id 
from Employees E, stat S 
where E.salary=S.salary