select W.name as warehouse_name, sum(case when P.product_id is null then 0 
                                     else W.units*P.Width*P.Length*P.Height end) as volume 
from Warehouse W left join Products P 
on W.product_id=P.product_id 
group by W.name 