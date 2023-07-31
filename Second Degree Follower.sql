select followee as "follower", count(*) as num 
from follow 
where followee in (select follower from follow)
group by followee
having count(*)>0;