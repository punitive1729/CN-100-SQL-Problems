select T.a as user1_id, T.b as user2_id 
from (select A.user_id as a, B.user_id as b, dense_rank() over (order by count(A.follower_id) desc) as rnk  
      from Relations as A, Relations as B
      where A.user_id<B.user_id and A.follower_id=B.follower_id
      group by A.user_id, B.user_id) as T
where T.rnk=1;