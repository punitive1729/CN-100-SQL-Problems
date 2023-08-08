select A.username, A.activity, A.startDate, A.endDate  
from UserActivity as A, (select username, count(*) as cnt 
                         from UserActivity 
                         group by username) as B 
where B.username=A.username and (B.cnt=1 or 1=(select count(*) 
                                               from UserActivity as C 
                                               where C.username=A.username and A.endDate<C.startDate));