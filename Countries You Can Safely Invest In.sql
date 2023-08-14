with duration as (
      select cid, sum(sd) as sdur, sum(cnt) as scnt
      from (
            select caller_id as cid, sum(duration) as sd, count(*) as cnt 
            from Calls 
            group by caller_id
            union
            select callee_id as cid, sum(duration) as sd, count(*) as cnt 
            from Calls 
            group by callee_id
      ) T
      group by cid
)

select B.name as country
from duration A, Country B, Person C 
where A.cid=C.id and substring(C.phone_number,1,3)=B.country_code
group by B.name
having (sum(A.sdur)*1.0/sum(A.scnt))>(select sum(sdur)*1.0/sum(scnt) 
                                      from duration);