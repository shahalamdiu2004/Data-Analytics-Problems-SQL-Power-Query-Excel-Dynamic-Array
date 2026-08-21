select 
sales_person,
string_agg (customer_id, ', ') as id_
from sales_rr
group by sales_person, sales_date
having count (*)>1
