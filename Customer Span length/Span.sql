select 
customer_id,
max(order_date)-min(order_date) as day_diff
from order_details
group by 1
order by day_diff