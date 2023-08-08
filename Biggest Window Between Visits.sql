select T.user_id as user_id, max(T.ed-T.sd) as biggest_window
from (select A.user_id as user_id, A.visit_date as sd, case when min(B.visit_date) is null then date('2021-1-1') else min(B.visit_date) end as ed
      from UserVisits as A left join UserVisits as B 
      on A.user_id=B.user_id and A.visit_date<B.visit_date
      group by A.user_id, A.visit_date) as T
group by T.user_id 
order by T.user_id;
