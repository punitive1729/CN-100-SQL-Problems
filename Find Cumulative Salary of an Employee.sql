select C.Id as Id, C.Month as Month, (case when A.Salary is null then 0 else A.Salary end + 
                      case when B.Salary is null then 0 else B.Salary end + 
                      case when C.Salary is null then 0 else C.Salary end ) as Salary
from (Employee A right join Employee B on A.Id=B.Id and B.Month=A.Month+1)
      right join Employee C on B.Id=C.Id and C.Month=B.Month+1
where (C.Id, C.Month) not in (select Id, max(Month) 
                            from Employee 
                            group by id)
order by C.Id,C.Month desc