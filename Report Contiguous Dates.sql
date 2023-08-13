with temp as (
    select fail_date as d, 'F' as type 
    from Failed  
    where fail_date<='2019-12-31' and fail_date>='2019-01-01'
    union
    select success_date as d, 'S' as type 
    from Succeeded
    where success_date<='2019-12-31' and success_date>='2019-01-01'
    order by d
)

select case when T.type ='S' then 'succeeded' 
            else 'failed' end as period_state, 
       min(T.sd) as start_date, T.ed as end_date
from (select A.d as sd, A.type as type, 
            case when min(B.d) is null then 
                (select max(d) from temp where type=A.type and d>=A.d) 
            else min(B.d)-1 end as ed 
      from temp A left join temp B 
      on A.d<=B.d and A.type!=B.type
      group by A.d, A.type 
      order by A.d) as T  
group by T.ed, T.type
order by start_date