with c1 as (select 
order_date,
customer_id,
row_number() over(partition by customer_id order by order_date asc ) as rn
from order_details),

c2 as (select * from c1
where rn <=2)

select 
customer_id,
string_agg(to_char(order_date,'DD-Mon-YY'),', ') as _date,
max (order_date)- min (order_date) as day_diff
from c2
group by customer_id
having count(*)=2 and max (order_date)- min (order_date)<=45




