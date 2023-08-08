select A.user_id, round(sum(case when B.action_value='confirmed' then 1 else 0 end)*1.0/count(A.time_stamp),2) as confirmation_rate
from Signups as A left join Confirmations as B 
on A.user_id=B.user_id
group by A.user_id