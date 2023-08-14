with person as (
    select user1_id as id from Friendship
    union
    select user2_id as id from Friendship
    order by id 
)

select A.user1_id, A.user2_id, count(B.id) as common_friend 
from Friendship A, person B 
where ((A.user1_id,B.id) in (select user1_id, user2_id from Friendship) or 
       (B.id,A.user1_id) in (select user1_id, user2_id from Friendship)) and 
      ((A.user2_id,B.id) in (select user1_id, user2_id from Friendship) or 
       (B.id,A.user2_id) in (select user1_id, user2_id from Friendship))
group by A.user1_id, A.user2_id
having count(distinct B.id)>2
order by user1_id, user2_id desc;