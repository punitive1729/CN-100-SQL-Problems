-- select A.score as score, B.rowno as "RANK" 
-- from Scores as A, (select score, row_number() over (order by score desc) as rowno
--                     from Scores 
--                     group by score
--                     order by score desc) as B 
-- where A.score=B.score
-- order by A.score desc


select score, dense_rank() over (order by score desc) as "RANK" 
from scores;

-- select score, rank() over (order by score desc) 
-- from scores;
