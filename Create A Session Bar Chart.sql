select '[0-5>' as bin, count(*) as total
from Sessions 
where duration<300
union
select '[5-10>' as bin, count(*) as total
from Sessions 
where duration<600 and duration>=300
union
select '[10-15>' as bin, count(*) as total
from Sessions 
where duration<900 and duration>=600
union
select '15 or more' as bin, count(*) as total
from Sessions 
where duration>900