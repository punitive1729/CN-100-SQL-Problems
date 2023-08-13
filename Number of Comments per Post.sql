with posts as (select distinct(sub_id) as post_id
               from Submissions 
               where parent_id is null) 
select post_id, count(distinct(S.sub_id)) as number_of_comments
from posts P left join Submissions S on P.post_id=S.parent_id 
group by P.post_id
order by P.post_id