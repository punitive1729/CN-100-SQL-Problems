select A.employee_id as employee_id, B.total as team_size 
from Employee as A, (select team_id, count(*) as total 
                     from Employee 
                     group by team_id) as B
where A.team_id = B.team_id; 
