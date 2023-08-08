select A.customer_number 
from Orders as A, Orders as B 
where A.order_number=B.order_number 
group by A.customer_number 
order by count(*) desc 
limit 1;