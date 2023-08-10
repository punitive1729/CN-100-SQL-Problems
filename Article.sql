select viewer_id as id
from Views 
where viewer_id!=author_id
group by viewer_id, view_date 
having count(*)>1;