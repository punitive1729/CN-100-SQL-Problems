select distinct(A.account_id) as account_id
from LogInfo A, LogInfo B 
where A.account_id = B.account_id 
      and A.login<=B.login and A.logout>=B.login 
      and A.ip_address!=B.ip_address;