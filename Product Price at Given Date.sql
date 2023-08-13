with minMax as (
    select product_id, max(change_date) as mxd  
    from Products 
    where change_date<='2019-08-16'
    group by product_id
)
select A.product_id, B.new_price as price 
from minMax A, Products B 
where A.product_id=B.product_id and A.mxd=B.change_date
union 
select product_id, 10 as price 
from Products 
where product_id not in (select product_id from minMax);