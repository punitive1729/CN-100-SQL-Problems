with recursive stat as (
    select 0 as cnt
    union
    select cnt+1 as cnt 
    from stat
    where cnt<(select max(total_visits) 
               from (
                    select count(*) as total_visits, sum(case when B.amount is null then 0 else 1 end) as success_visits
                    from Visits A left join Transactions B 
                    on A.user_id=B.user_id and A.visit_date=B.transaction_date
                    group by A.user_id, A.visit_date
                    ) as T 
                )
)
select A.cnt as transactions_count, sum(case when B.success_visits is null then 0 else 1 end) as 
    visits_count
from stat A left join (select count(*) as total_visits, sum(case when B.amount is null then 0 else 1 end) as success_visits
                       from Visits A left join Transactions B 
                       on A.user_id=B.user_id and A.visit_date=B.transaction_date
                       group by A.user_id, A.visit_date) B
on A.cnt=B.success_visits
group by A.cnt;
