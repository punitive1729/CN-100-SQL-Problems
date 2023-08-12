select P.name as name, sum(I.rest) as rest, sum(I.paid) as paid, 
       sum(I.canceled) as canceled, sum(I.refunded) as refunded
from Product P, Invoice I 
where P.product_id=I.product_id 
group by P.product_id, P.name
order by P.name