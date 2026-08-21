select 

to_char (sales_date,'mon') as month_name,
sum (sales_amount) as total_sales

from sales
group by extract (month from sales_date), month_name
order by extract (month from sales_date)