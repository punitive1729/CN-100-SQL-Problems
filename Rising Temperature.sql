select A.id as "Id" 
from Weather as A, Weather as B 
where A.recordDate=B.recordDate+1 and A.Temperature>B.Temperature;