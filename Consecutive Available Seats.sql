select distinct A.seat_id 
from Cinema A, Cinema B 
where abs(A.seat_id-B.seat_id)=1 and A.free='t' and B.free='t'
order by A.seat_id;