with minmax as (
    select activity, count(*) as total 
    from Friends
    group by activity
)
select activity 
from minmax 
where total != (select min(total) from minmax) and total != (select max(total) from minmax);