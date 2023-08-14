with max_salary as (
    select DepartmentId, max(Salary) as mxs
    from Employee 
    group by DepartmentId
)

select A.Name as "Department", B.Name as "Employee", C.mxs as Salary 
from Department A, Employee B, max_salary C 
where A.Id=B.DepartmentId and C.DepartmentId=A.Id and C.mxs=B.Salary 
