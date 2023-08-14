with trust as (
    select A.user_id, count(*) as tot, 
        sum(case when contact_email in (select email from Customers) then 1 else 0 end) as tc 
    from Contacts A, Customers B
    where A.user_id=B.customer_id 
    group by A.user_id
)
select A.invoice_id, B.customer_name, A.price, 
    case when C.tot is null then 0 else C.tot end as contacts_cnt, 
    case when C.tc is null then 0 else C.tc end as trusted_contacts_cnt
from Invoices A left join Customers B on A.user_id=B.customer_id 
    left join trust C on C.user_id=A.user_id
order by A.invoice_id