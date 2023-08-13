select lower(product_name) as product_name,
    substring(cast(sale_date as varchar),1,7) as sale_date, count(*) as total
from Sales 
group by lower(product_name), substring(cast(sale_date as varchar),1,7)
order by product_name, sale_date