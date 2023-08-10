select NameCust as "Customers"
from Customers 
where Id not in (select distinct(CustomerId) 
                 from Orders);