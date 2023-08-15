select
    id,
    sum(case when month = 'Jan' then revenue else null end) AS Jan_Revenue,
    sum(case when month = 'Feb' then revenue else null end) AS Feb_Revenue,
    sum(case when month = 'Mar' then revenue else null end) AS Mar_Revenue,
    sum(case when month = 'Apr' then revenue else null end) AS Apr_Revenue,
    sum(case when month = 'May' then revenue else null end) AS May_Revenue,
    sum(case when month = 'Jun' then revenue else null end) AS Jun_Revenue,
    sum(case when month = 'Jul' then revenue else null end) AS Jul_Revenue,
    sum(case when month = 'Aug' then revenue else null end) AS Aug_Revenue,
    sum(case when month = 'Sep' then revenue else null end) AS Sep_Revenue,
    sum(case when month = 'Oct' then revenue else null end) AS Oct_Revenue,
    sum(case when month = 'Nov' then revenue else null end) AS Nov_Revenue,
    sum(case when month = 'Dec' then revenue else null end) AS Dec_Revenue
from Department
group by id
order by id