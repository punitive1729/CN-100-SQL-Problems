select query_name, round(avg(rating/position),2) as quality 
from Queries 
group by query_name