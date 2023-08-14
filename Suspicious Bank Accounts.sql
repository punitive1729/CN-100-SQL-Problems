with monthlystat as (
    select account_id, substring(cast(day as varchar), 1,7) as month, 
        sum(case when type_pro='Creditor' then amount else 0 end) as inc,
        dense_rank() over (partition by account_id order by substring(cast(day as varchar), 1,7))
    from Transactions 
    group by account_id, month
)
select distinct A.account_id 
from monthlystat A, monthlystat B, Accounts C  
where A.account_id=B.account_id and 
    A.dense_rank+1=B.dense_rank and 
    A.account_id=C.account_id and 
    A.inc>C.max_income and B.inc>C.max_income; 
