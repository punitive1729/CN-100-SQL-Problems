with stat as (
    select customer_id, product_id, count(*), 
        dense_rank() over (partition by customer_id order by count(*)) as rnk
    from Orders 
    group by customer_id, product_id
)
select A.customer_id, A.product_id, P.product_name 
from stat A left join Products P 
on A.product_id=P.product_id
order by A.customer_id, A.product_id
