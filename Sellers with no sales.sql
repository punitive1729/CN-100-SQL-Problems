select seller_name 
from Seller 
where seller_id not in (select distinct(seller_id) 
                        from Orders 
                        where cast(sale_date as varchar) like '2020%');