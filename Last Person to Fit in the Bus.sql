select A.person_name 
from Queue as A, Queue as B 
where B.turn<=A.turn
group by A.person_id, A.person_name
having sum(B.weight)<=1000
order by sum(B.weight) desc 
limit 1;