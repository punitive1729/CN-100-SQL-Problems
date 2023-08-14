select A.Name as Name
from Candidate A, Vote B 
where A.id=B.CandidateId
group by A.id, A.Name 
order by count(B.id) desc 
limit 1;