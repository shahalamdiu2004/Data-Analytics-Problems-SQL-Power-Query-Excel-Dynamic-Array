with c1 as (
select 
department,
count (*) as total_employees,
rank() over (order by count (*) desc)
from hr_data
group by department
order by total_employees desc)

select 
string_agg (department, ', ')
from c1
where rank =1

