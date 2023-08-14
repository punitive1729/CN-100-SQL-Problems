select U.user_id, U.user_name, (sum(case when T.amt is null then 0 else T.amt end)+U.credit) as credit, 
    case when sum(T.amt)+U.credit<0 then 'Yes' else 'No' end as credit_limit_breached  
from (select paid_by as user_id, -amount as amt 
      from Transactions 
      union
      select paid_to as user_id, amount as amt 
      from Transactions ) T right join Users U  
on T.user_id=U.user_id
group by U.user_id, U.user_name, U.credit
order by U.user_id