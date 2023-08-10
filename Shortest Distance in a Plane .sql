select ((A.x-B.x)*(A.x-B.x))+((A.y-B.y)*(A.y-B.y)) as shortest  
from point_2d as A, point_2d as B 
where A.x!=B.x or A.y!=B.y
order by shortest limit 1;