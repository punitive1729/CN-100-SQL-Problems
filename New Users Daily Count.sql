select T.activity_date as login_date, count(T.cnt) as user_count
from (select A.user_id, A.activity_date, count(B.activity_date) as cnt
      from Traffic A, Traffic B 
      where A.user_id=B.user_id and A.activity='login' and A.activity=B.activity 
            and A.activity_date>=B.activity_date
      group by A.user_id, A.activity_date
      having cnt=1) T
where abs(T.activity_date-'2019-06-30')<=90 
group by T.activity_date

