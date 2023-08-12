with first_order as (
    select customer_id, min(order_date) as mnd 
    from Delivery 
    group by customer_id
)
select round((100.00*count(*))/(select count(*) from first_order),2) as immediate_percentage
from first_order F, Delivery D 
where D.customer_id=F.customer_id and D.order_date=F.mnd
and D.customer_pref_delivery_date=F.mnd