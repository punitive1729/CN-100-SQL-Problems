select transaction_id 
from Transactions as A, (select date(day) as day, max(amount) as mx 
                         from Transactions 
                         group by date(day)) as B
where date(A.day)=B.day and A.amount = B.mx
order by A.transaction_id;