select distinct A.session_id
from Playback A, Ads B 
where A.customer_id=B.customer_id and ( 
      A.start_time>B.timestamp or B.timestamp>A.end_time)
order by A.session_id; 