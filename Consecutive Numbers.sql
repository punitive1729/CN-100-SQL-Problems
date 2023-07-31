select distinct(A.Num) as ConsecutiveNums 
from Logs as A, Logs as B, Logs as C 
where A.Id=B.Id+1 and B.Id=C.Id+1 and A.Num=B.Num and A.Num=C.Num;