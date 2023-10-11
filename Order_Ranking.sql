select
	c.first_name || ' ' || c.last_name as customer_name,
	c.email,
	count(s.order_id) as total_orders,
	rank() over (order by count(s.order_id) desc) as rank
from customers c
join orders s
	on c.customer_id = s.customer_id
group by 1,2
order by 3 desc