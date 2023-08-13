with temp as (
    select A.id as aid, B.id as bid, C.id as cid
    from Stadium A left join Stadium B on A.id+1=B.id
         left join Stadium C on C.id=B.id+1
    where A.people>99 and B.people>99 and C.people>99 
)
select B.id, B.visit_date, B.people
from (select aid as id
      from temp 
      union
      select bid  as id 
      from temp 
      union
      select cid as id 
      from temp) A, Stadium B 
where A.id=B.id  
order by B.visit_date