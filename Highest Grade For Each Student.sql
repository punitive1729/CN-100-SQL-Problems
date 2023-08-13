with mxg as (
    select student_id, max(grade) as grade
    from Enrollments 
    group by student_id 
)
select A.student_id, min(A.course_id) as course_id, B.grade 
from Enrollments A, mxg B 
where B.student_id=A.student_id and A.grade=B.grade
group by A.student_id, B.grade 