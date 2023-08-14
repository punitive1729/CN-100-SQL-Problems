with uniq as (
    select * 
    from Insurance A 
    where (lat,lon) not in (select lat,lon from Insurance where pid!=A.pid)
)

select sum(tiv_2016) as tiv_2016
from uniq
where tiv_2015 in (select tiv_2015 
                   from Insurance 
                   group by tiv_2015
                   having count(*)>1);