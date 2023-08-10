select A.name, sum(case when B.distance is null then 0 else B.distance end) as travelled_distance 
from Users as A left join Rides as B 
on A.id=B.user_id 
group by A.id, A.name
order by travelled_distance desc, A.name asc