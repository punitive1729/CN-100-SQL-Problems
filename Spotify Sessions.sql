select distinct A.session_id
from Playback as A, Ads as B 
where A.customer_id=B.customer_id and (B.timestamp<A.start_time or B.timestamp>A.end_time)
order by A.session_id;
