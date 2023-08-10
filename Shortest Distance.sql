select abs(A.x-min(B.x)) as shortest  
from point A, point B 
where A.x<B.x
group by A.x
order by shortest 
limit 1;