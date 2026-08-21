with c1 as (select
extract (month from sales_date) as month_no,
to_char (sales_date, 'Mon') as month_name,
sum (sales_amount) as total_sales
from sales_growth
group by 1,2
order by 1),

c2 as (select
month_no,
month_name,
total_sales, 
total_sales - lag (total_sales) over (order by month_no) as month_diff
from c1)

select 
month_name,
total_sales,
month_diff,
round(month_diff/ lag (total_sales) over (order by month_no),2)*100 || '%' as sales_growth
from c2


