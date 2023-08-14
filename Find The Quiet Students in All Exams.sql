with minmax as (
    select exam_id, max(score) as mxs, min(score) as mns 
    from Exam 
    group by exam_id
)
select A.student_id, A.student_name 
from Student A, Exam B 
where A.student_id=B.student_id
group by A.student_id, A.student_name
having min(B.score) > (select min(mns) from minmax) and max(B.score)<(select max(mxs) from minmax);