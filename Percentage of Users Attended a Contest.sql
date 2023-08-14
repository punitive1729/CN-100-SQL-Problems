with total as (
    select count(distinct user_id) as tot from Users
)
select contest_id, round(count(distinct user_id)*100.00/(select tot from total),2) as percentage
from Register 
group by contest_id
order by percentage desc, contest_id