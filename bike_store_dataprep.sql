select 
	ord.order_id,
	CONCAT(cust.first_name, ' ', cust.last_name) as customer,
	cust.city,
	cust.state,
	ord.order_date,
	sum(items.quantity) as total_units,
	sum(items.quantity * items.list_price) as revenue,
	prod.product_name,
	cat.category_name,
	bra.brand_name,
	sto.store_name,
	concat(staf.first_name, ' ', staf.last_name) as sales_rep
from sales.orders ord
join sales.customers cust on ord.customer_id = cust.customer_id
join sales.order_items items on ord.order_id = items.order_id
join production.products prod on items.product_id = prod.product_id
join production.categories cat on prod.category_id = cat.category_id
join production.brands bra on prod.brand_id = bra.brand_id
join sales.stores sto on ord.store_id = sto.store_id
join sales.staffs staf on ord.staff_id = staf.staff_id
group by
	ord.order_id,
	CONCAT(cust.first_name, ' ', cust.last_name),
	cust.city,
	cust.state,
	ord.order_date,
	prod.product_name,
	cat.category_name,
	bra.brand_name,
	sto.store_name,
	concat(staf.first_name, ' ', staf.last_name)
