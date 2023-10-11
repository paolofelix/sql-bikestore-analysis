with product_categories as (
select
	product_id,
	category_name
from products
inner join categories on products.category_id = categories.category_id
),
product_sales_ym as (
select
	extract(year from order_date) as year,
	extract(month from order_date) as month,
	product_id,
	sum(quantity) as units_sold
from orders
	inner join
		order_items
		on
		orders.order_id = order_items.order_id
group by 1,2,3
)
select
	product_sales_ym.month,
	product_categories.category_name,
	avg(product_sales_ym.units_sold) as average_units_sold
from product_sales_ym
inner join product_categories
	on
	product_categories.product_id = product_sales_ym.product_id
group by 1,2
order by 1 desc