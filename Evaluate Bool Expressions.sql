with comp as (
    select A.value as lv, B.left_operand, B.operator, B.right_operand, C.value as rv 
    from Variables A, Expressions B, Variables C 
    where B.left_operand=A.name and C.name=B.right_operand
)
select left_operand, operator, right_operand, 
    case when operator='=' then case when lv=rv then 'true' else 'false' end  
         when operator='>' then case when lv>rv then 'true' else 'false' end  
         when operator='<' then case when lv<rv then 'true' else 'false' end 
         end as value 
from comp