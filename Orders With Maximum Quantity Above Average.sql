with stat as (
    select order_id, avg(quantity) as av, max(quantity) as mx 
    from OrdersDetails
    group by order_id
)
select order_id 
from stat
where mx>(select max(av) from stat);