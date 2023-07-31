select A.genre as "genre", max(-C.Budget+B.Domestic+B.Worldwide) as "net_profit"
from genre as A, earning as B, IMDB as C
where C.Title like '%(2012)%' and A.Movie_id=B.Movie_id and C.Movie_id=B.Movie_id and A.genre is not null
group by A.genre
order by A.genre;