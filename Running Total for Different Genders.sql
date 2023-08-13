select A.gender, A.day, sum(B.score_points) as total 
from Scores A, Scores B 
where A.gender=B.gender and B.day<=A.day 
group by A.gender, A.day
order by A.gender, A.day;