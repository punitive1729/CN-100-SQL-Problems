select Title, Rating
from IMDB as A, earning as B 
where B.Movie_id=A.Movie_id and B.Domestic>100000000 and A.MetaCritic>60 and A.Title like '%(2012)%';