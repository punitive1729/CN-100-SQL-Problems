with mxx as (
    select company_id, max(salary) as mxs 
    from Salaries
    group by company_id
)
select A.company_id, A.employee_id, A.employee_name,
    round(case when B.mxs<1000 then salary 
         when B.mxs>=1000 and B.mxs<=10000 then 0.76*salary 
         when B.mxs>10000 then 0.51*salary end) as salary 
from Salaries A, mxx B 
where A.company_id=B.company_id;