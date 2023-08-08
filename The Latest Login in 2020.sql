select user_id, max(time_stamp) as last_stamp
from Logins 
where cast(time_stamp as varchar) like '2020%'
group by user_id
