select A.id, case when
                      A.id%2=1 then
                                case when 
                                         B.id is null then A.student 
                                     else
                                         B.student end 
                  else 
                        B.student end as student
from seat as A left join seat as B 
on (A.id%2=0 and A.id=B.id+1) or (A.id%2=1 and A.id=B.id-1);