select title, rating 
from IMDB as A, genre as B
where A.Movie_id=B.Movie_id and A.Budget >= 40000000 and  A.Title like '%(2014)%' and B.genre like 'C%';