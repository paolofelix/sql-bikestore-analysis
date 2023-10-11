-- Table Creation

-- Creating brands table
create table brands (
	brand_id int,
	brand_name varchar
)

select * from brands
limit 10

-- creating categories table
create table categories (
	category_id int,
	category_name varchar
)

select * from categories
limit 10

-- creating customers table
create table customers (
	customer_id int,
	first_name varchar,
	last_name varchar,
	phone varchar,
	email varchar,
	street varchar,
	city varchar,
	state varchar,
	zip_code int
)

select * from customers
limit 10

-- creating order_items table
create table order_items (
	order_id int,
	item_id int,
	product_id int,
	quantity int,
	list_price float,
	discount float
)

select * from order_items
limit 10

-- creating orders table
create table orders (
	order_id int,
	customer_id int,
	order_status int,
	order_date date,
	required_date date,
	shipped_date date,
	store_id int,
	staff_id int
)

select * from orders
limit 10


-- creating products table
create table products (
	product_id int,
	product_name varchar,
	brand_id int,
	category_id int,
	model_year int,
	list_price float
)

select * from products
limit 10


-- creating staffs table
create table staffs (
	staff_id int,
	first_name varchar,
	last_name varchar,
	email varchar,
	phone varchar,
	active int,
	store_id int,
	manager_id int
)

select * from staffs
limit 10

-- creating stocks table
create table stocks (
	store_id int,
	product_id int,
	quantity int
)

select * from stocks
limit 10

--creating stores table
create table stores (
	store_id int,
	store_name varchar,
	phone varchar,
	email varchar,
	street varchar,
	city varchar,
	state varchar,
	zipcode int
)

select * from stores
limit 10

