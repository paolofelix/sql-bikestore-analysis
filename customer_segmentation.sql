with customer_stats as (
	select
		customer_id,
		sum(quantity * list_price * (1- discount)) as total_spent,
		count(distinct orders.order_id) as total_orders,
		to_char(current_date, 'J'):: integer - to_char(max(order_date),'J'):: integer as days_since_last_purchase
	from orders
	join order_items
		on orders.order_id = order_items.order_id
	group by 1
)
select
	customer_stats.customer_id,
	customers.first_name,
	customers.email,
	case when total_orders > 1 then 'repeat buyer'
		else 'one-time buyer'
		end as purchase_frequency,
	case when days_since_last_purchase > 90 then 'recent buyer'
		else 'not recent buyer'
		end as purchase_recency,
	case 
		when total_spent / (select max(total_spent) from customer_stats) >= .65 then 'big spender'
		when total_spent / (select max(total_spent) from customer_stats) <= .30 then 'low spender'
		else 'average spender'
		end as buying_power
from customer_stats
join customers
	on customers.customer_id = customer_stats.customer_id