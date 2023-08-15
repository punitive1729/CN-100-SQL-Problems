select A.genre, max((B.rating+B.metacritic/10.0)/2) as weighted_rating 
from genre A, IMDB B 
where A.Movie_id=B.Movie_id and A.genre is not null and B.Title like '%(2014)%'
group by A.genre;