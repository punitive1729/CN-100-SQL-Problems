with recursive intlist as (
    select 1 as val 
    union 
    select val+1 
    from intlist
    where val<(select max(customer_id) from Customers)
)
select A.val as ids 
from intlist A left join Customers B on A.val=B.customer_id 
where B.customer_id is null