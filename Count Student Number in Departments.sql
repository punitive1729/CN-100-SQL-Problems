select B.dept_name, count(A.student_id) as student_number 
from Student A right join Department B 
on A.dept_id=B.dept_id 
group by B.dept_id, B.dept_name
order by student_number desc, B.dept_name;