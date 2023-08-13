select Q.id,Q.year, case when A.npv is null then 0 else A.npv end as npv 
from NPV A right join Queries Q 
on A.id=Q.id and A.year=Q.year