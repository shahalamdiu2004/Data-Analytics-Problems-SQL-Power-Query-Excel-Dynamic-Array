with c1 as (select 
sales_person,
unnest (string_to_array (sales_jan_to_jun, ', ')) :: numeric as sales

from sales_comma)

select
sales_person,
min (sales) as min_sales,
max (sales) as max_sales
from c1
group by sales_person
order by sales_person