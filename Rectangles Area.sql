select A.id as p1, B.id as p2, abs(A.x_value-B.x_value)*abs(A.y_value-B.y_value) as area
from Points A,Points B 
where A.id<B.id and (abs(A.x_value-B.x_value)*abs(A.y_value-B.y_value))>0
order by area desc, p1, p2;