with average as (
    select event_type, 1.0*sum(occurences)/count(*) as avgocc 
    from Events 
    group by event_type
)
select A.business_id 
from Events A, average B 
where A.event_type=B.event_type and A.occurences>B.avgocc
group by A.business_id 
having count(*)>1;