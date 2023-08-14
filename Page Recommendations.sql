select distinct page_id as recommended_page
from Likes
where user_id in (select case when user1_id=1 then user2_id 
                              when user2_id=1 then user1_id end
                  from Friendship) and
      page_id not in(select page_id from Likes where user_id=1)